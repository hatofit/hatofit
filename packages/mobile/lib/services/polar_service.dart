import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/data/polar_dict.dart';
import 'package:polar_hr_devices/models/session_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PolarService extends GetxController {
  final _getConnect = GetConnect();
  final polar = Polar();
  final screenHeight = Get.height;
  final screenWidth = Get.width;
  var heartRate = '--'.obs;
  var connectedDeviceId = 'No Device'.obs;
  final List<Map<String, dynamic>> detectedDevices =
      List<Map<String, dynamic>>.empty(growable: true);

  final List<DataModel> _dataModel = [];
  final List<DeviceModel> _deviceModelList = [];
  var _sessionModel = SessionModel('exerciseId', 0, 0, [], []);

  final isStartWorkout = false.obs;
  final _isDevelopment = false.obs;
  StreamSubscription<PolarStreamingData<PolarHrSample>>? _hrSubscription;
  StreamSubscription<PolarStreamingData<PolarGyroSample>>? _gyroSubscription;
  StreamSubscription<PolarStreamingData<PolarPpgSample>>? _ppgSubscription;
  StreamSubscription<PolarStreamingData<PolarPpiSample>>? _ppiSubscription;
  StreamSubscription<PolarStreamingData<PolarMagnetometerSample>>?
      _magnetometerSubscription;
  StreamSubscription<PolarStreamingData<PolarAccSample>>? _accSubscription;
  StreamSubscription<PolarStreamingData<PolarEcgSample>>? _ecgSubscription;

  @override
  void onInit() {
    saveToJSON('pathing', 666);
    _isDevelopment.toggle();
    debugPrint("============================================\n"
        "Is Development : ${_isDevelopment.value}\n"
        "============================================");
    debugPrint("============================================\n"
        "Date Time : ${DateTime.now().toString()}\n"
        "============================================");
    scanPolarDevices();
    super.onInit();
  }

  @override
  void onReady() {
    dummyDebugging();
    super.onReady();
  }

  @override
  void onClose() {
    _streamCancelation();
    super.onClose();
  }

  void dummyDebugging() {
    Timer.periodic(const Duration(microseconds: 1), (timer) {
      if (DateTime.now().hour == 16 &&
          DateTime.now().minute == 8 &&
          DateTime.now().millisecond == 00 &&
          DateTime.now().microsecond == 00) {
        isStartWorkout.toggle();
        // starWorkout('Development', 3600);
        dummyWorkout();
        debugPrint("============================================\n"
            "Date Time : ${DateTime.now().toString()}\n"
            "============================================");
        timer.cancel();
      }
    });
  }

  void dummyWorkout() {
    var counter = 0;
    final now = DateTime.now().toUtc().microsecondsSinceEpoch;
    // logic now - exerciseDuration
    final startStream1 = now - (900 * 1000000);
    final startStream2 = now - (1800 * 1000000);
    final startStream3 = now - (2700 * 1000000);
    final startStream4 = now - (3600 * 1000000);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      var json = _sessionModel.toJson();
      JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
      var stringJson = prettyPrint.convert(json);
      _dataModel.add(DataModel(counter, now, _deviceModelList));
      _deviceModelList.clear();
      _sessionModel = SessionModel('Test 1', 60, now, [], _dataModel);

      if (counter <= 60) {
        debugPrint("=============================\n"
            "JSON DATA $counter\n"
            "$stringJson"
            "\n=============================");
      }
      if (counter == 60) {
        saveToJSON('Test 1', 60);
        _sessionModel = SessionModel('Test 1', 60, now, [], _dataModel);
      }
      if (counter == 900) {
        _sessionModel =
            SessionModel('15 Minutes', startStream1, now, [], _dataModel);
        saveToJSON('15 Minutes', startStream1);
      }
      if (counter == 1800) {
        _sessionModel =
            SessionModel('30 Minutes', startStream2, now, [], _dataModel);
        saveToJSON('30 Minutes', startStream2);
      }
      if (counter == 2700) {
        _sessionModel =
            SessionModel('45 Minutes', startStream3, now, [], _dataModel);
        saveToJSON('45 Minutes', startStream3);
      }
      if (counter == 3600) {
        _sessionModel =
            SessionModel('60 Minutes', startStream4, now, [], _dataModel);
        saveToJSON('60 Minutes', startStream4);
        timer.cancel();
        isStartWorkout.toggle();
      }
      counter++;
    });
  }

  // sacan detected polar devices
  void scanPolarDevices() {
    polar.searchForDevice().listen((polardDeviceInfo) {
      bool isAlreadyDetected = detectedDevices.any((detectedDevice) =>
          detectedDevice['deviceId'] == polardDeviceInfo.deviceId);
      if (!isAlreadyDetected) {
        String nameReplace = '';
        String imageURLReplace = '';
        PolarDict.deviceImageList.forEach((name, imageURL) {
          if (polardDeviceInfo.name.contains('Sense')) {
            nameReplace = name;
            imageURLReplace = imageURL;
          } else {
            nameReplace = name;
            imageURLReplace = imageURL;
          }
        });
        detectedDevices.add({
          'deviceId': polardDeviceInfo.deviceId,
          'address': polardDeviceInfo.address,
          'rssi': polardDeviceInfo.rssi,
          'name': nameReplace,
          'isConnectable': polardDeviceInfo.isConnectable,
          'imageURL': imageURLReplace,
        });
        debugPrint('Detected Device: ${detectedDevices.toString()}');
      }
      update();
    });
  }

  void connectDevice(String deviceId) {
    final connectFuture = polar.connectToDevice(deviceId);
    final deviceConnectedFuture = polar.deviceConnected.first;

    // Wait for either connection or timeout
    Future.wait([connectFuture, deviceConnectedFuture])
        .timeout(const Duration(seconds: 10)) // Set the timeout duration
        .then((_) {
      streamWhenReady(deviceId);
      Get.back();
      Get.snackbar('Success', 'Yeay... Berhasil connect',
          barBlur: 3.5, backgroundColor: Colors.white);
    }).catchError((error) {
      debugPrint("============================================\n"
          "Error connecting $error"
          "============================================");
      polar.disconnectFromDevice(deviceId);
      Get.back();
      Get.snackbar('Error', 'Waduh... Reconnect lagi',
          barBlur: 3.5, backgroundColor: Colors.white);
    });
  }

  // disconnect from polar device by device id
  void disconnectDevice(String deviceId) {
    _streamCancelation();
    polar.disconnectFromDevice(deviceId);
    polar.deviceDisconnected.first;
  }

  void streamResume() {
    _gyroSubscription?.resume();
    _ppgSubscription?.resume();
    _ppiSubscription?.resume();
    _magnetometerSubscription?.resume();
    _accSubscription?.resume();
    _ecgSubscription?.resume();
  }

  void streamPause() {
    _gyroSubscription?.pause();
    _ppgSubscription?.pause();
    _ppiSubscription?.pause();
    _magnetometerSubscription?.pause();
    _accSubscription?.pause();
    _ecgSubscription?.pause();
  }

  Future<void> _streamCancelation() async {
    await _gyroSubscription?.cancel();
    await _ppgSubscription?.cancel();
    await _ppiSubscription?.cancel();
    await _magnetometerSubscription?.cancel();
    await _accSubscription?.cancel();
    await _ecgSubscription?.cancel();
    await _hrSubscription?.cancel();
  }

  // void starWorkout(String exerciseId, int exerciseDuration) {
  //   final now = DateTime.now().toUtc().microsecondsSinceEpoch;
  //   // logic now - exerciseDuration
  //   final startStream = now - (exerciseDuration * 1000000);
  //   var counter = 0;
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     _dataModel.add(DataModel(counter, now, _deviceModelList));

  //     if (isStartWorkout.value == false) {
  //       _sessionModel =
  //           SessionModel(exerciseId, startStream, now, [], _dataModel);
  //       saveToJSON(connectedDeviceId.value, startStream);

  //       uploadData();
  //       timer.cancel();
  //     }

  //     counter++;
  //   });
  // }

  // get Available Features Data by device id
  void streamWhenReady(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );

    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);
    if (availableTypes.contains(PolarDataType.hr)) {
      _hrSubscription = polar.startHrStreaming(deviceId).listen((hrData) {
        heartRate.value = hrData.samples.first.hr.toString();
        if (isStartWorkout.value == true) {
          // check if previous list already have hr data
          if (!_deviceModelList
              .any((element) => element.type == 'PolarDataType.hr')) {
            // if yes, add new data to the list
            if (hrData.samples.first.rrsMs.isEmpty) {
              _deviceModelList.add(DeviceModel('PolarDataType.hr', deviceId, [
                {
                  'hr': hrData.samples.first.hr,
                }
              ]));
            } else {
              _deviceModelList.add(DeviceModel('PolarDataType.hr', deviceId, [
                {
                  'hr': hrData.samples.first.hr,
                  'rrsMs': hrData.samples.first.rrsMs,
                }
              ]));
            }
          }
        }
      });
    }

    if (_isDevelopment.value == true) {
      if (availableTypes.contains(PolarDataType.acc)) {
        _accSubscription = polar.startAccStreaming(deviceId).listen((accData) {
          if (isStartWorkout.value == true) {
            if (!_deviceModelList
                .any((element) => element.type == 'PolarDataType.acc')) {
              _deviceModelList.add(DeviceModel('PolarDataType.acc', deviceId, [
                {
                  'x': accData.samples.first.x,
                  'y': accData.samples.first.y,
                  'z': accData.samples.first.z,
                }
              ]));
            }
          }
        });
      }

      if (availableTypes.contains(PolarDataType.ecg)) {
        _ecgSubscription = polar.startEcgStreaming(deviceId).listen((ecgData) {
          if (isStartWorkout.value == true) {
            if (!_deviceModelList
                .any((element) => element.type == 'PolarDataType.ecg')) {
              _deviceModelList.add(DeviceModel('PolarDataType.ecg', deviceId, [
                {
                  'voltage': ecgData.samples.first.voltage,
                }
              ]));
            }
          }
        });
      }

      if (availableTypes.contains(PolarDataType.gyro)) {
        _gyroSubscription =
            polar.startGyroStreaming(deviceId).listen((gyroData) {
          if (isStartWorkout.value == true) {
            if (!_deviceModelList
                .any((element) => element.type == 'PolarDataType.gyro')) {
              _deviceModelList.add(DeviceModel('PolarDataType.gyro', deviceId, [
                {
                  'x': gyroData.samples.first.x,
                  'y': gyroData.samples.first.y,
                  'z': gyroData.samples.first.z,
                }
              ]));
            }
          }
        });
      }

      if (availableTypes.contains(PolarDataType.magnetometer)) {
        _magnetometerSubscription = polar
            .startMagnetometerStreaming(deviceId)
            .listen((magnetometerData) {
          if (isStartWorkout.value == true) {
            if (!_deviceModelList.any(
                (element) => element.type == 'PolarDataType.magnetometer')) {
              _deviceModelList
                  .add(DeviceModel('PolarDataType.magnetometer', deviceId, [
                {
                  'x': magnetometerData.samples.first.x,
                  'y': magnetometerData.samples.first.y,
                  'z': magnetometerData.samples.first.z,
                }
              ]));
            }
          }
        });
      }
      // if (availableTypes.contains(PolarDataType.ppi)) {
      //   _ppiSubscription = polar.startPpiStreaming(deviceId).listen((ppiData) {
      //     if (isStartWorkout.value == true) {
      //       if (!_deviceModelList
      //           .any((element) => element.type == 'PolarDataType.ppi')) {
      //         _deviceModelList.add(DeviceModel('PolarDataType.ppi', deviceId, [
      //           {
      //             'ppi': ppiData.samples.first.ppi,
      //             'errorEstimate': ppiData.samples.first.errorEstimate,
      //             'blockerBit': ppiData.samples.first.blockerBit,
      //             'skinContactStatus': ppiData.samples.first.skinContactStatus,
      //             'skinContactSupported':
      //                 ppiData.samples.first.skinContactSupported,
      //           }
      //         ]));
      //       }
      //     }
      //   });
      // }
      if (availableTypes.contains(PolarDataType.ppg)) {
        _ppgSubscription = polar.startPpgStreaming(deviceId).listen((ppgData) {
          if (isStartWorkout.value == true) {
            if (!_deviceModelList
                .any((element) => element.type == 'PolarDataType.ppg')) {
              _deviceModelList.add(DeviceModel('PolarDataType.ppg', deviceId, [
                {
                  'channelSamples': ppgData.samples.first.channelSamples,
                }
              ]));
            }
          }
        });
      }
    }
  }

  void saveToJSON(String deviceId, int startStream) async {
    var json = _sessionModel.toJson();
    JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    var stringJson = prettyPrint.convert(json);
    debugPrint("=============================\n"
        "JSON DATA\n"
        "$stringJson"
        "\n=============================");

    String jsonString = jsonEncode(_sessionModel);

    // save to file to local storage
    final Directory? directory = await getExternalStorageDirectory();

    if (directory != null) {
      String path = '${directory.path}/log-$deviceId-$startStream.json';
      await File(path).writeAsString(jsonString);
    }
  }

  Future<void> uploadData() async {
    try {
      final response = await _getConnect.post(
        "${dotenv.env['API_BASE_URL'] ?? ''}/session",
        jsonEncode(_sessionModel),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      // print response body with indent format
      // var json = jsonEncode(response.body);
      // JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
      // var stringJson = prettyPrint.convert(json);
      // debugPrint(stringJson);
      if (response.statusCode == 200) {
        Get.snackbar(
          'Alhamdulillah',
          'Success upload data to server',
        );
      } else {
        final dynamic jsonResponse = jsonDecode(response.body);
        debugPrint(jsonResponse['message']);
        Get.snackbar(
          'Astaghfirullah',
          'Failed upload data to server',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Astaghfirullah',
        'Internet connection error',
      );
    }
  }
}
