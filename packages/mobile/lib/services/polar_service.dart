import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/models/session_model.dart';
import 'package:polar_hr_devices/services/internet_service.dart';
import 'package:polar_hr_devices/services/storage_service.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';

const Map<String, String> _deviceImageList = {
  'Polar H10': 'assets/images/polar/polar-h10.webp',
  'Polar OH1': 'assets/images/polar/polar-oh1.webp',
  'Polar H9': 'assets/images/polar/polar-h9.webp',
  'Polar Verity Sense': 'assets/images/polar/polar-verity-sense.webp',
};

class PolarService extends GetxController {
  final _polar = Polar();
  final _heartRate = '--'.obs;
  final _connectedDeviceId = 'No Device'.obs;
  final _detectedDevices = List<Map<String, dynamic>>.empty(growable: true);

  final isStartWorkout = false.obs;
  final List<Stream<PolarStreamingData<dynamic>>> _availableDevices = [];
  final List<StreamSubscription> _availableSubscriptions = [];

  Polar get polar => _polar;
  String get heartRate => _heartRate.value;
  String get connectedDeviceId => _connectedDeviceId.value;
  List<Map<String, dynamic>> get detectedDevices => _detectedDevices;

  set heartRate(String value) => _heartRate.value = value;
  set connectedDeviceId(String value) => _connectedDeviceId.value = value;

  SessionDataItem _currentSecondDataItem = SessionDataItem(
    second: 0,
    timeStamp: DateTime.now().microsecondsSinceEpoch,
    devices: [],
  );

  SessionModel _sessionModel = SessionModel(
    exerciseId: 'BoilerPlating',
    startTime: DateTime.now().microsecondsSinceEpoch,
    endTime: 0,
    timelines: [],
    data: [],
  );
  @override
  void onReady() {
    scanPolarDevices();
    super.onReady();
  }

  @override
  void onClose() {
    _streamCancelation();
    super.onClose();
  }

  void starWorkout(String exerciseId, int exerciseDuration) {
    var currentSecond = 0;
    final endStream =
        DateTime.now().microsecondsSinceEpoch + (exerciseDuration * 1000000);
    _sessionModel = SessionModel(
        exerciseId: exerciseId,
        startTime: DateTime.now().microsecondsSinceEpoch,
        endTime: endStream,
        timelines: [],
        data: []);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _currentSecondDataItem = SessionDataItem(
        second: currentSecond,
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        devices: List.from(_currentSecondDataItem.devices),
      );
      _sessionModel.data.add(_currentSecondDataItem);
      if (isStartWorkout.value == false) {
        currentSecond = 0;
        StorageService().saveToJSON(
            'session/raw/log-${_sessionModel.exerciseId}-$_connectedDeviceId-${DateTime.now().microsecondsSinceEpoch - (exerciseDuration * 1000000)}',
            _sessionModel);
        InternetService().postSession(_sessionModel);
        timer.cancel();
      }
      _currentSecondDataItem.devices.clear();
      currentSecond++;
    });
  }

  void streamWhenReady(String deviceId) async {
    await _polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );

    final availableTypes =
        await _polar.getAvailableOnlineStreamDataTypes(deviceId);

    if (availableTypes.contains(PolarDataType.hr)) {
      Stream<PolarStreamingData<PolarHrSample>> hrSample =
          _polar.startHrStreaming(deviceId);
      StreamSubscription hrSubscription = hrSample.listen((hrData) {
        _heartRate.value = hrData.samples.last.hr.toString();

        if (isStartWorkout.value == true) {
          bool hasHrDevice = _currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.hr');

          if (!hasHrDevice) {
            if (hrData.samples.last.rrsMs.isEmpty) {
              _currentSecondDataItem.devices.add(
                SessionDataItemDevice(
                  type: 'PolarDataType.hr',
                  identifier: deviceId,
                  value: [
                    {'hr': hrData.samples.last.hr}
                  ],
                ),
              );
            } else {
              _currentSecondDataItem.devices.add(
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
      _availableDevices.add(hrSample);
      _availableSubscriptions.add(hrSubscription);
    }
    if (availableTypes.contains(PolarDataType.acc)) {
      Stream<PolarStreamingData<PolarAccSample>> accData =
          _polar.startAccStreaming(deviceId);
      StreamSubscription accSubscription = accData.listen((accData) {
        if (isStartWorkout.value == true) {
          bool hasAccDevice = _currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.acc');

          if (!hasAccDevice) {
            _currentSecondDataItem.devices.add(
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
      _availableDevices.add(accData);
      _availableSubscriptions.add(accSubscription);
    }
    if (availableTypes.contains(PolarDataType.ecg)) {
      Stream<PolarStreamingData<PolarEcgSample>> ecgData =
          _polar.startEcgStreaming(deviceId);
      StreamSubscription ecgSubscription = ecgData.listen((ecgData) {
        if (isStartWorkout.value == true) {
          bool hasEcgDevice = _currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.ecg');

          if (!hasEcgDevice) {
            _currentSecondDataItem.devices.add(
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
      _availableDevices.add(ecgData);
      _availableSubscriptions.add(ecgSubscription);
    }
    if (availableTypes.contains(PolarDataType.gyro)) {
      Stream<PolarStreamingData<PolarGyroSample>> gyroData =
          _polar.startGyroStreaming(deviceId);
      StreamSubscription gyroSubscription = gyroData.listen((gyroData) {
        // calcute how much gyro data is available in a second

        if (isStartWorkout.value == true) {
          bool hasGyroDevice = _currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.gyro');

          if (!hasGyroDevice) {
            _currentSecondDataItem.devices.add(
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
      _availableDevices.add(gyroData);
      _availableSubscriptions.add(gyroSubscription);
    }
    if (availableTypes.contains(PolarDataType.magnetometer)) {
      Stream<PolarStreamingData<PolarMagnetometerSample>> magnetometerData =
          _polar.startMagnetometerStreaming(deviceId);
      StreamSubscription magnetometerSubscription =
          magnetometerData.listen((magnetometerData) {
        if (isStartWorkout.value == true) {
          bool hasMagnetometerDevice = _currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.magnetometer');

          if (!hasMagnetometerDevice) {
            _currentSecondDataItem.devices.add(
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
      _availableDevices.add(magnetometerData);
      _availableSubscriptions.add(magnetometerSubscription);
    }
    if (availableTypes.contains(PolarDataType.ppg)) {
      Stream<PolarStreamingData<PolarPpgSample>> ppgData =
          _polar.startPpgStreaming(deviceId);
      StreamSubscription ppgSubscription = ppgData.listen((ppgData) {
        if (isStartWorkout.value == true) {
          bool hasPpgDevice = _currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.ppg');

          if (!hasPpgDevice) {
            _currentSecondDataItem.devices.add(
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
      _availableDevices.add(ppgData);
      _availableSubscriptions.add(ppgSubscription);
    }
  }

  // sacan detected _polar devices
  void scanPolarDevices() {
    _polar.searchForDevice().listen((polardDeviceInfo) {
      bool isAlreadyDetected = _detectedDevices.any((detectedDevice) =>
          detectedDevice['deviceId'] == polardDeviceInfo.deviceId);
      if (!isAlreadyDetected) {
        String nameReplace = '';
        String imageURLReplace = '';
        _deviceImageList.forEach((name, imageURL) {
          if (polardDeviceInfo.name.contains('Sense')) {
            nameReplace = name;
            imageURLReplace = imageURL;
          } else {
            nameReplace = name;
            imageURLReplace = imageURL;
          }
        });
        _detectedDevices.add({
          'deviceId': polardDeviceInfo.deviceId,
          'address': polardDeviceInfo.address,
          'rssi': polardDeviceInfo.rssi,
          'name': nameReplace,
          'isConnectable': polardDeviceInfo.isConnectable,
          'imageURL': imageURLReplace,
          'battery': 0,
        });
        debugPrint('Detected Device: ${_detectedDevices.toString()}');
      }
      update();
    });
  }

  void connectDevice(String deviceId) {
    final connectFuture = _polar.connectToDevice(deviceId);
    final deviceConnectedFuture = _polar.deviceConnected.first;

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
    }).catchError((error) {
      debugPrint("============================================\n"
          "Error connecting $error"
          "============================================");
      _polar.disconnectFromDevice(deviceId);
      Get.back();
      Get.snackbar('Error', 'Waduh... Reconnect lagi',
          colorText: ThemeManager().isDarkMode ? Colors.white : Colors.black,
          backgroundColor: ThemeManager().isDarkMode
              ? ColorConstants.darkContainer.withOpacity(0.9)
              : ColorConstants.lightContainer.withOpacity(0.9));
    });
  }

  // disconnect from _polar device by device id
  void disconnectDevice(String deviceId) {
    _streamCancelation();
    _polar.disconnectFromDevice(deviceId);
    _polar.deviceDisconnected.last;
  }

  void streamResume() {
    for (var element in _availableSubscriptions) {
      element.resume();
    }
  }

  void streamPause() {
    for (var element in _availableSubscriptions) {
      element.pause();
    }
  }

  Future<void> _streamCancelation() async {
    for (var element in _availableSubscriptions) {
      await element.cancel();
    }
  }
}
