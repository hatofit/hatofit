import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/core/domain/failure.dart';
import 'package:hatofit/app/core/domain/success.dart';
import 'package:hatofit/data/models/polar_device.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:polar/polar.dart';

import '../../data/models/session.dart';

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
  }

  Future<void> turnOnBluetooth() async {
    if (isAdptrOn.value == false) {
      await FlutterBluePlus.turnOn();
    }
  }

  final _availableSubscriptions = <StreamSubscription>[];
  final heartRate = Rx<int?>(null);
  final _currentSecondDataItem = Rx<SessionDataItem?>(null);

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

        bool hasHrDevice = _currentSecondDataItem.value!.devices
            .any((element) => element.type == 'PolarDataType.hr');

        if (!hasHrDevice) {
          if (hrData.samples.last.rrsMs.isEmpty) {
            _currentSecondDataItem.value!.devices.add(
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
            _currentSecondDataItem.value!.devices.add(
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
      });
      _availableSubscriptions.add(hrSubscription);
    }
    if (availableTypes.contains(PolarDataType.acc)) {
      StreamSubscription accSubscription =
          _polarBLE.startAccStreaming(deviceId).listen((accData) {
        bool hasAccDevice = _currentSecondDataItem.value!.devices
            .any((element) => element.type == 'PolarDataType.acc');

        if (!hasAccDevice) {
          _currentSecondDataItem.value!.devices.add(
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
        bool hasEcgDevice = _currentSecondDataItem.value!.devices
            .any((element) => element.type == 'PolarDataType.ecg');

        if (!hasEcgDevice) {
          _currentSecondDataItem.value!.devices.add(
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

        bool hasGyroDevice = _currentSecondDataItem.value!.devices
            .any((element) => element.type == 'PolarDataType.gyro');

        if (!hasGyroDevice) {
          _currentSecondDataItem.value!.devices.add(
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
        bool hasMagnetometerDevice = _currentSecondDataItem.value!.devices
            .any((element) => element.type == 'PolarDataType.magnetometer');

        if (!hasMagnetometerDevice) {
          _currentSecondDataItem.value!.devices.add(
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
        bool hasPpgDevice = _currentSecondDataItem.value!.devices
            .any((element) => element.type == 'PolarDataType.ppg');

        if (!hasPpgDevice) {
          _currentSecondDataItem.value!.devices.add(
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

  Future<Either<Failure, Success>> connectDevice(String deviceId) async {
    try {
      await _polarBLE.connectToDevice(deviceId);
      return Right(Success(code: 'OK', message: 'Connected', data: deviceId));
    } catch (e) {
      await _polarBLE.disconnectFromDevice(deviceId);
      return Left(
          Failure(code: 'ERR', message: 'Disconnected', details: e.toString()));
    }
  }

  Future<Either<Failure, Success>> disconnectDevice(String deviceId) async {
    try {
      _streamCancelation();
      await _polarBLE.disconnectFromDevice(deviceId);
      return Right(
          Success(code: 'OK', message: 'Disconnected', data: deviceId));
    } catch (e) {
      return Left(
          Failure(code: 'ERR', message: 'Disconnected', details: e.toString()));
    }
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
