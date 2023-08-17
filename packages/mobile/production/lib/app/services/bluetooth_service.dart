import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/data/models/polar_device.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

import '../../data/models/session.dart';
import '../themes/app_theme.dart';
import '../themes/colors_constants.dart';

class BluetoothService extends GetxService {
  final FlutterBluePlus flutterBluePlus = FlutterBluePlus();
  final _polarBLE = Polar();
  final isAdptrOn = Rx<bool>(false);
  final isAdptrContd = Rx<bool>(false);

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    print('====&&&====\nBLUETOOTH SERVICE INIT\n====&&&====\n');
    await _polarBLE.requestPermissions();
    await Permission.location.request();
    await Permission.storage.request();
    FlutterBluePlus.adapterState.listen((event) async {
      if (event == BluetoothAdapterState.on) {
        isAdptrOn.value = true;
      } else {
        isAdptrOn.value = false;
      }
    });
    _polarBLE.deviceConnecting
        .listen((event) => debugPrint('Device connecting'));
    _polarBLE.batteryLevel.listen((e) {
      debugPrint('ID : ${e.identifier}\nBattery: ${e.level}');
    });
    _polarBLE.deviceConnected.listen((event) {
      //  connectedDeviceId = event.deviceId;
      isAdptrContd.value = true;
      debugPrint('Device connected to ${event.deviceId} ${isAdptrContd.value}');
    });
    _polarBLE.deviceDisconnected.listen((event) {
      //  heartRate.value = '--';
      //  connectedDeviceId = 'Device disconnected';
      isAdptrContd.value = false;
      debugPrint(
          'Device disconnected from ${event.info.deviceId} ${isAdptrContd.value}');
    });
  }

  Future<void> turnOnBluetooth() async {
    if (isAdptrOn.value == false) {
      await FlutterBluePlus.turnOn();
    }
  }

  final _availableSubscriptions = <StreamSubscription>[];
  final heartRate = Rx<int>(0);
  SessionDataItem currSecDataItem = SessionDataItem(
    second: 0,
    timeStamp: DateTime.now().microsecondsSinceEpoch,
    devices: [],
  );

  void streamWhenReady(String deviceId) async {
    await _polarBLE.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availableTypes =
        await _polarBLE.getAvailableOnlineStreamDataTypes(deviceId);

    if (availableTypes.contains(PolarDataType.hr)) {
      StreamSubscription hrSubscription =
          _polarBLE.startHrStreaming(deviceId).listen((hrData) {
        heartRate.value = hrData.samples.last.hr;

        bool hasHrDevice = currSecDataItem.devices
            .any((element) => element.type == 'PolarDataType.hr');

        if (!hasHrDevice) {
          if (hrData.samples.last.rrsMs.isEmpty) {
            currSecDataItem.devices.add(
              SessionDataItemDevice(
                type: 'PolarDataType.hr',
                identifier: deviceId,
                value: [
                  SessionDataItemDeviceValue(
                      hr: HrData(
                          time: DateTime.now().microsecondsSinceEpoch,
                          bpm: hrData.samples.last.hr))
                ],
              ),
            );
          } else {
            currSecDataItem.devices.add(
              SessionDataItemDevice(
                type: 'PolarDataType.hr',
                identifier: deviceId,
                value: [
                  SessionDataItemDeviceValue(
                      hr: HrData(
                          time: DateTime.now().microsecondsSinceEpoch,
                          bpm: hrData.samples.last.hr,
                          rrsMs: hrData.samples.last.rrsMs))
                ],
              ),
            );
          }
        }
        print('=========START STREAMING=========\n'
            'Stored Data: ${currSecDataItem.toJson()}\n'
            '=========START STREAMING=========\n');
      });
      _availableSubscriptions.add(hrSubscription);
    }
    if (availableTypes.contains(PolarDataType.acc)) {
      StreamSubscription accSubscription =
          _polarBLE.startAccStreaming(deviceId).listen((accData) {
        bool hasAccDevice = currSecDataItem.devices
            .any((element) => element.type == 'PolarDataType.acc');

        if (!hasAccDevice) {
          currSecDataItem.devices.add(
            SessionDataItemDevice(
              type: 'PolarDataType.acc',
              identifier: deviceId,
              value: [
                SessionDataItemDeviceValue(
                    acc: AccData(
                        time: DateTime.now().microsecondsSinceEpoch,
                        x: accData.samples.last.x,
                        y: accData.samples.last.y,
                        z: accData.samples.last.z))
              ],
            ),
          );
        }
      });
      _availableSubscriptions.add(accSubscription);
    }
    if (availableTypes.contains(PolarDataType.ecg)) {
      StreamSubscription ecgSubscription =
          _polarBLE.startEcgStreaming(deviceId).listen((ecgData) {
        bool hasEcgDevice = currSecDataItem.devices
            .any((element) => element.type == 'PolarDataType.ecg');

        if (!hasEcgDevice) {
          currSecDataItem.devices.add(
            SessionDataItemDevice(
              type: 'PolarDataType.ecg',
              identifier: deviceId,
              value: [
                SessionDataItemDeviceValue(
                    ecg: EcgData(
                        time: DateTime.now().microsecondsSinceEpoch,
                        voltage: ecgData.samples.last.voltage))
              ],
            ),
          );
        }
      });
      _availableSubscriptions.add(ecgSubscription);
    }
    if (availableTypes.contains(PolarDataType.gyro)) {
      StreamSubscription gyroSubscription =
          _polarBLE.startGyroStreaming(deviceId).listen((gyroData) {
        // calcute how much gyro data is available in a second

        bool hasGyroDevice = currSecDataItem.devices
            .any((element) => element.type == 'PolarDataType.gyro');

        if (!hasGyroDevice) {
          currSecDataItem.devices.add(
            SessionDataItemDevice(
              type: 'PolarDataType.gyro',
              identifier: deviceId,
              value: [
                SessionDataItemDeviceValue(
                    gyro: GyroData(
                        time: DateTime.now().microsecondsSinceEpoch,
                        x: gyroData.samples.last.x,
                        y: gyroData.samples.last.y,
                        z: gyroData.samples.last.z))
              ],
            ),
          );
        }
      });
      _availableSubscriptions.add(gyroSubscription);
    }
    if (availableTypes.contains(PolarDataType.magnetometer)) {
      StreamSubscription magnetometerSubscription = _polarBLE
          .startMagnetometerStreaming(deviceId)
          .listen((magnetometerData) {
        bool hasMagnetometerDevice = currSecDataItem.devices
            .any((element) => element.type == 'PolarDataType.magnetometer');

        if (!hasMagnetometerDevice) {
          currSecDataItem.devices.add(
            SessionDataItemDevice(
              type: 'PolarDataType.magnetometer',
              identifier: deviceId,
              value: [
                SessionDataItemDeviceValue(
                    magnetometer: MagnetometerData(
                        time: DateTime.now().microsecondsSinceEpoch,
                        x: magnetometerData.samples.last.x,
                        y: magnetometerData.samples.last.y,
                        z: magnetometerData.samples.last.z))
              ],
            ),
          );
        }
      });
      _availableSubscriptions.add(magnetometerSubscription);
    }
    if (availableTypes.contains(PolarDataType.ppg)) {
      StreamSubscription ppgSubscription =
          _polarBLE.startPpgStreaming(deviceId).listen((ppgData) {
        bool hasPpgDevice = currSecDataItem.devices
            .any((element) => element.type == 'PolarDataType.ppg');

        if (!hasPpgDevice) {
          currSecDataItem.devices.add(
            SessionDataItemDevice(
              type: 'PolarDataType.ppg',
              identifier: deviceId,
              value: [
                SessionDataItemDeviceValue(
                    ppg: PpgData(
                  time: DateTime.now().microsecondsSinceEpoch,
                  samples: ppgData.samples.last.channelSamples,
                ))
              ],
            ),
          );
        }
      });
      _availableSubscriptions.add(ppgSubscription);
    }
  }

  static const Map<String, String> deviceImageList = {
    'Polar H10': 'assets/images/polar/polar-h10.webp',
    'Polar OH1': 'assets/images/polar/polar-oh1.webp',
    'Polar H9': 'assets/images/polar/polar-h9.webp',
    'Polar Verity Sense': 'assets/images/polar/polar-verity-sense.webp',
  };

  final detectedDevices = <PolarDevice>[];

  void scanPolarDevices() {
    detectedDevices.clear();
    StreamSubscription search =
        _polarBLE.searchForDevice().listen((polardDeviceInfo) {
      String? nameReplace;
      String? imageAsset;
      final bool isAlreadyAdded = detectedDevices
          .any((element) => element.deviceId == polardDeviceInfo.deviceId);
      if (!isAlreadyAdded) {
        if (polardDeviceInfo.name.contains('H10')) {
          nameReplace = 'Polar H10';
        } else if (polardDeviceInfo.name.contains('OH1')) {
          nameReplace = 'Polar OH1';
        } else if (polardDeviceInfo.name.contains('H9')) {
          nameReplace = 'Polar H9';
        } else if (polardDeviceInfo.name.contains('Sense')) {
          nameReplace = 'Polar Verity Sense';
        }
        imageAsset = deviceImageList[nameReplace] ?? polardDeviceInfo.name;
        nameReplace ??= polardDeviceInfo.name;
        detectedDevices.add(
          PolarDevice(
            name: nameReplace,
            address: polardDeviceInfo.address,
            deviceId: polardDeviceInfo.deviceId,
            rssi: polardDeviceInfo.rssi,
            imageAsset: imageAsset,
            isConnectable: polardDeviceInfo.isConnectable,
          ),
        );
      }
    });
    Future.delayed(const Duration(seconds: 10), () async {
      await search.cancel();
    });
  }

  void connectDevice(String deviceId) {
    final connectFuture = _polarBLE.connectToDevice(deviceId);
    final deviceConnectedFuture = _polarBLE.deviceConnected.first;

    // Wait for either connection or timeout
    Future.wait([connectFuture, deviceConnectedFuture])
        .timeout(const Duration(seconds: 10)) // Set the timeout duration
        .then((_) {
      streamWhenReady(deviceId);
      Get.back();
      Get.snackbar('Success', 'Yeay... Berhasil connect',
          colorText: ThemeManager().isDarkMode ? Colors.white : Colors.black,
          backgroundColor: ThemeManager().isDarkMode
              ? ColorConstants.darkContainer.withOpacity(0.9)
              : ColorConstants.lightContainer.withOpacity(0.9));
      isAdptrContd.value = true;
    }).catchError((error) {
      _polarBLE.disconnectFromDevice(deviceId);
      Get.back();
      Get.snackbar('Sorry', 'Failed to connect ',
          colorText: ThemeManager().isDarkMode ? Colors.white : Colors.black,
          backgroundColor: ThemeManager().isDarkMode
              ? ColorConstants.darkContainer.withOpacity(0.9)
              : ColorConstants.lightContainer.withOpacity(0.9));
    });
  }

  // disconnect from _polarBLE device by device id
  void disconnectDevice(String deviceId) {
    _streamCancelation();
    _polarBLE.disconnectFromDevice(deviceId);
    _polarBLE.deviceDisconnected.last;
  }
  // void streamResume() {
  //   for (var element in _availableSubscriptions) {
  //     element.resume();
  //   }
  // }

  // void streamPause() {
  //   for (var element in _availableSubscriptions) {
  //     element.pause();
  //   }
  // }

  Future<void> _streamCancelation() async {
    for (var element in _availableSubscriptions) {
      await element.cancel();
    }
  }
}
