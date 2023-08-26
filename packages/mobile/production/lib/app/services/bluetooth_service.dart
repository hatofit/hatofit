import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/polar_device.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
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
  final List<StreamSubscription> _availableSubscriptions = [];

  final heartRate = Rx<int>(0);

  final sesionValue = <SessionDataItemDevice>[];

  Future<BluetoothService> init() async {
    getBluetoothStatus();
    polar.deviceDisconnected.listen(
      (e) {
        isConnectedDevice.value = false;
        streamCancelation();
        _availableSubscriptions.clear();
        heartRate.value = 0;
        // vibrate with pattern 1s - 0.5s - 1s
        Vibration.vibrate(pattern: [1000, 500, 1000]);
      },
    );
    polar.batteryLevel.listen(
      (e) {
        PolarBatteryLevelEvent;
        detectedDevices
            .firstWhere((element) => element.deviceId == e.identifier)
            .battery = e.level;
      },
    );
    polar.deviceConnected.listen(
      (e) {
        isConnectedDevice.value = true;
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
    await Permission.storage.request();
    final sto = await Permission.storage.isGranted;
    return sto;
  }

  Future<void> getBluetoothStatus() async {
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
    }
  }

  void scanPolarDevices() {
    polar.requestPermissions();
    polar.searchForDevice().listen(
      (event) {
        String? nameReplace;
        String? imageAsset;
        final bool isDetected = detectedDevices.any(
          (element) => element.deviceId == event.deviceId,
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
          detectedDevices.add(
            PolarDevice(
              name: nameReplace,
              address: event.address,
              deviceId: event.deviceId,
              rssi: event.rssi,
              imageAsset: imageAsset,
              isConnectable: event.isConnectable,
            ),
          );
        }
      },
    );
  }

  void connectDevice(String deviceId) {
    final connectFuture = polar.connectToDevice(deviceId);
    final deviceConnectedFuture = polar.deviceConnected.first;

    Future.wait([connectFuture, deviceConnectedFuture])
        .timeout(const Duration(seconds: 3))
        .then((_) {
      streamWhenReady(deviceId);
      Get.back();
      Get.snackbar('Success', 'Yeay... Berhasil connect',
          colorText: ThemeManager().isDarkMode ? Colors.white : Colors.black,
          backgroundColor: ThemeManager().isDarkMode
              ? ColorConstants.darkContainer.withOpacity(0.9)
              : ColorConstants.lightContainer.withOpacity(0.9));
    }).catchError((error) {
      polar.disconnectFromDevice(deviceId);
      Get.back();
      Get.snackbar('Error', 'Waduh... Reconnect lagi',
          colorText: ThemeManager().isDarkMode ? Colors.white : Colors.black,
          backgroundColor: ThemeManager().isDarkMode
              ? ColorConstants.darkContainer.withOpacity(0.9)
              : ColorConstants.lightContainer.withOpacity(0.9));
    });
  }

  void disconnectDevice(String deviceId) async {
    await streamCancelation();
    await polar.disconnectFromDevice(deviceId);
    await polar.deviceDisconnected.last;
  }

  Future<void> streamCancelation() async {
    for (var element in _availableSubscriptions) {
      await element.cancel();
    }
  }

  void streamWhenReady(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);

    if (availableTypes.contains(PolarDataType.hr)) {
      StreamSubscription hrSubscription =
          polar.startHrStreaming(deviceId).listen((hrData) {
        heartRate.value = hrData.samples.last.hr;

        if (isStartWorkout.value == true) {
          bool hasHrDevice =
              sesionValue.any((element) => element.type == 'PolarDataType.hr');

          if (!hasHrDevice) {
            if (hrData.samples.last.rrsMs.isEmpty) {
              sesionValue.add(
                SessionDataItemDevice(
                  type: 'PolarDataType.hr',
                  identifier: deviceId,
                  value: [
                    {'hr': hrData.samples.last.hr}
                  ],
                ),
              );
            } else {
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
        }
      });
      _availableSubscriptions.add(hrSubscription);
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
      _availableSubscriptions.add(accSubscription);
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
      _availableSubscriptions.add(ecgSubscription);
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
      _availableSubscriptions.add(gyroSubscription);
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
      _availableSubscriptions.add(magnetometerSubscription);
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
      _availableSubscriptions.add(ppgSubscription);
    }
  }
}
