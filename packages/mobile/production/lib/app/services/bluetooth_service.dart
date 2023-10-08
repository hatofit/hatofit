import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/polar_device.dart';
import 'package:hatofit/app/modules/dashboard/views/home/home_controller.dart';
import 'package:hatofit/utils/snackbar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';
import 'package:vibration/vibration.dart';

import '../models/session_model.dart';

class BluetoothService extends GetxService {
  final isBluetoothOn = false.obs;
  final isConnectedDevice = false.obs;
  final detectedDevices = <PolarDevice>[].obs;

  final polar = Polar();

  final isStartWorkout = false.obs;

  final sesionValue = <SessionDataItemDevice>[];

  Future<BluetoothService> init() async {
    getBluetoothStatus();
    polar.deviceDisconnected.listen(
      (e) async {
        isConnectedDevice.value = false;
        final device = detectedDevices
            .firstWhere((element) => element.info.deviceId == e.info.deviceId);
        if (device.polarSubs.isNotEmpty) {
          await streamCancelation(device.polarSubs);
        }
        HomeController().update();
        device.hr.value = 0;
        device.isConnect.value = false;
        Vibration.vibrate(pattern: [1000, 500, 1000]);
      },
    );
    polar.batteryLevel.listen(
      (e) {
        detectedDevices
            .firstWhere((element) => element.info.deviceId == e.identifier)
            .battery = e.level;
      },
    );
    polar.deviceConnected.listen(
      (e) {
        isConnectedDevice.value = true;
        final device = detectedDevices
            .firstWhere((element) => element.info.deviceId == e.deviceId);
        device.isConnect.value = true;

        HomeController().update();
        Vibration.vibrate(pattern: [500, 0, 0, 500]);
      },
    );
    return this;
  }

  @override
  void onInit() {
    getBluetoothStatus();
    super.onInit();
  }

  Future<bool> askPermission() async {
    await polar.requestPermissions();
    await Permission.location.request();
    final x = await Permission.manageExternalStorage.request();
    final sto = await Permission.manageExternalStorage.isGranted;
    if (x.isPermanentlyDenied) {
      openAppSettings();
    }
    return sto;
  }

  Future<void> getBluetoothStatus() async {
    FlutterBluePlus.setLogLevel(LogLevel.none);

    FlutterBluePlus.adapterState.listen((event) async {
      if (event == BluetoothAdapterState.on) {
        isBluetoothOn.value = true;
      } else {
        isBluetoothOn.value = false;
      }
    });
  }

  Future<void> turnOnBluetooth() async {
    if (isBluetoothOn.value == false) {
      await FlutterBluePlus.turnOn();
      final device = BluetoothDevice.fromId('Polar');
      device.connect();
    }
  }

  void scanPolarDevices() {
    polar.requestPermissions();
    polar.searchForDevice().listen(
      (event) {
        String? nameReplace;
        String? imageAsset;
        final bool isDetected = detectedDevices.any(
          (element) => element.info.deviceId == event.deviceId,
        );
        if (!isDetected) {
          if (event.name.contains('H10')) {
            nameReplace = 'Polar H10';
            imageAsset = 'assets/images/polar/polar-h10.webp';
          } else if (event.name.contains('OH1')) {
            nameReplace = 'Polar OH1';
            imageAsset = 'assets/images/polar/polar-oh1.webp';
          } else if (event.name.contains('H9')) {
            nameReplace = 'Polar H9';
            imageAsset = 'assets/images/polar/polar-h9.webp';
          } else if (event.name.contains('Sense')) {
            nameReplace = 'Polar Verity Sense';
            imageAsset = 'assets/images/polar/polar-verity-sense.webp';
          }
          nameReplace ??= event.name;
          imageAsset ??= 'assets/images/polar/polar-h10.webp';
          event.name = nameReplace;
          detectedDevices.add(
            PolarDevice(
              // name: nameReplace,
              // address: event.address,
              // deviceId: event.deviceId,
              // rssi: event.rssi,
              info: event,
              imageAsset: imageAsset,
              // isConnectable: event.isConnectable,
              fble: BluetoothDevice.fromId(event.address),
            ),
          );
        }
      },
    );
  }

  void connectDevice(PolarDevice device) {
    final deviceId = device.info.deviceId;
    final connectFuture = polar.connectToDevice(deviceId);
    final deviceConnectedFuture = polar.deviceConnected.first;
    Future.wait([
      connectFuture,
      deviceConnectedFuture,
    ]).timeout(const Duration(seconds: 10)).then((_) async {
      await device.fble!.connect();
      streamWhenReady(device);
      Get.back();
      MySnackbar.success('Success', 'Connected to ${device.info.name}');
    }).catchError((error) {
      polar.disconnectFromDevice(deviceId);
      Get.back();
      MySnackbar.error('Error', 'Failed to connect to ${device.info.name}');
    });
  }

  void disconnectDevice(PolarDevice device) async {
    final deviceId = device.info.deviceId;
    await polar.disconnectFromDevice(deviceId);
    await device.fble!.disconnect();
    await polar.deviceDisconnected.last;

    final subs = device.polarSubs;
    if (subs.isNotEmpty) {
      await streamCancelation(subs);
    }
  }

  Future<void> streamCancelation(List<StreamSubscription> subs) async {
    for (var element in subs) {
      await element.cancel();
    }
  }

  Future<Set<PolarDataType>> getAvailableTypes(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);
    return availableTypes;
  }

  void streamWhenReady(PolarDevice device) async {
    final deviceId = device.info.deviceId;
    final availableTypes = await getAvailableTypes(deviceId);
    if (availableTypes.contains(PolarDataType.hr)) {
      StreamSubscription hrSubscription =
          polar.startHrStreaming(deviceId).listen((hrData) async {
        if (isStartWorkout.value == true) {
          bool hasHrDevice =
              sesionValue.any((element) => element.type == 'PolarDataType.hr');
          if (!hasHrDevice) {
            sesionValue.add(
              SessionDataItemDevice(
                type: 'PolarDataType.hr',
                identifier: deviceId,
                value: [
                  {
                    'hr': hrData.samples.last.hr,
                    'rrsMs': hrData.samples.last.rrsMs
                  }
                ],
              ),
            );
          }
        }
        device.hr.value = hrData.samples.last.hr;
        final rssi = await device.fble!.readRssi(timeout: 30);
        device.info.rssi = rssi;
      });
      // _availableSubscriptions.add(hrSubscription);
      device.polarSubs.add(hrSubscription);
    }
    if (availableTypes.contains(PolarDataType.acc)) {
      StreamSubscription accSubscription =
          polar.startAccStreaming(deviceId).listen((accData) {
        if (isStartWorkout.value == true) {
          bool hasAccDevice =
              sesionValue.any((element) => element.type == 'PolarDataType.acc');

          if (!hasAccDevice) {
            sesionValue.add(
              SessionDataItemDevice(
                type: 'PolarDataType.acc',
                identifier: deviceId,
                value: [
                  {
                    'timeStamp':
                        accData.samples.last.timeStamp.microsecondsSinceEpoch,
                    'x': accData.samples.last.x,
                    'y': accData.samples.last.y,
                    'z': accData.samples.last.z,
                  }
                ],
              ),
            );
          }
        }
      });
      // _availableSubscriptions.add(accSubscription);
      device.polarSubs.add(accSubscription);
    }
    if (availableTypes.contains(PolarDataType.ecg)) {
      StreamSubscription ecgSubscription =
          polar.startEcgStreaming(deviceId).listen((ecgData) {
        if (isStartWorkout.value == true) {
          bool hasEcgDevice =
              sesionValue.any((element) => element.type == 'PolarDataType.ecg');

          if (!hasEcgDevice) {
            sesionValue.add(
              SessionDataItemDevice(
                type: 'PolarDataType.ecg',
                identifier: deviceId,
                value: [
                  {
                    'timeStamp':
                        ecgData.samples.last.timeStamp.microsecondsSinceEpoch,
                    'voltage': ecgData.samples.last.voltage,
                  }
                ],
              ),
            );
          }
        }
      });
      // _availableSubscriptions.add(ecgSubscription);
      device.polarSubs.add(ecgSubscription);
    }
    if (availableTypes.contains(PolarDataType.gyro)) {
      StreamSubscription gyroSubscription =
          polar.startGyroStreaming(deviceId).listen((gyroData) {
        if (isStartWorkout.value == true) {
          bool hasGyroDevice = sesionValue
              .any((element) => element.type == 'PolarDataType.gyro');

          if (!hasGyroDevice) {
            sesionValue.add(
              SessionDataItemDevice(
                type: 'PolarDataType.gyro',
                identifier: deviceId,
                value: [
                  {
                    'timeStamp':
                        gyroData.samples.last.timeStamp.microsecondsSinceEpoch,
                    'x': gyroData.samples.last.x,
                    'y': gyroData.samples.last.y,
                    'z': gyroData.samples.last.z,
                  }
                ],
              ),
            );
          }
        }
      });
      // _availableSubscriptions.add(gyroSubscription);
      device.polarSubs.add(gyroSubscription);
    }
    if (availableTypes.contains(PolarDataType.magnetometer)) {
      StreamSubscription magnetometerSubscription =
          polar.startMagnetometerStreaming(deviceId).listen((magnetometerData) {
        if (isStartWorkout.value == true) {
          bool hasMagnetometerDevice = sesionValue
              .any((element) => element.type == 'PolarDataType.magnetometer');

          if (!hasMagnetometerDevice) {
            sesionValue.add(
              SessionDataItemDevice(
                type: 'PolarDataType.magnetometer',
                identifier: deviceId,
                value: [
                  {
                    'timeStamp': magnetometerData
                        .samples.last.timeStamp.microsecondsSinceEpoch,
                    'x': magnetometerData.samples.last.x,
                    'y': magnetometerData.samples.last.y,
                    'z': magnetometerData.samples.last.z,
                  }
                ],
              ),
            );
          }
        }
      });
      // _availableSubscriptions.add(magnetometerSubscription);
      device.polarSubs.add(magnetometerSubscription);
    }
    if (availableTypes.contains(PolarDataType.ppg)) {
      StreamSubscription ppgSubscription =
          polar.startPpgStreaming(deviceId).listen((ppgData) {
        if (isStartWorkout.value == true) {
          bool hasPpgDevice =
              sesionValue.any((element) => element.type == 'PolarDataType.ppg');

          if (!hasPpgDevice) {
            sesionValue.add(
              SessionDataItemDevice(
                type: 'PolarDataType.ppg',
                identifier: deviceId,
                value: [
                  {
                    'timeStamp':
                        ppgData.samples.last.timeStamp.microsecondsSinceEpoch,
                    'channelSamples': ppgData.samples.last.channelSamples,
                  }
                ],
              ),
            );
          }
        }
      });
      // _availableSubscriptions.add(ppgSubscription);
      device.polarSubs.add(ppgSubscription);
    }
  }
}
