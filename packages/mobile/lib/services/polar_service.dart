import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
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
  final detectedDevices = List<Map<String, dynamic>>.empty(growable: true);
  final isDarkMode = Get.isDarkMode;
  final _isDevelopment = false.obs;
  final isStartWorkout = false.obs;
  List<Stream<PolarStreamingData<dynamic>>> availableDevices = [];
  List<StreamSubscription> availableSubscriptions = [];

  SessionDataItem currentSecondDataItem = SessionDataItem(
    second: 0,
    timeStamp: DateTime.now().microsecondsSinceEpoch,
    devices: [],
  );

  SessionModel sessionModel = SessionModel(
    exerciseId: 'BoilerPlating',
    startTime: DateTime.now().microsecondsSinceEpoch,
    endTime: 0,
    timelines: [],
    data: [],
  );
  @override
  void onReady() {
    _isDevelopment.toggle();
    debugPrint("=============================\n"
        "Is Development : ${_isDevelopment.value}\n"
        "=============================");
    debugPrint("=============================\n"
        "Date Time : ${DateTime.now().toString()}\n"
        "=============================");
    scanPolarDevices();
    super.onReady();
  }

  @override
  void onClose() {
    _streamCancelation();
    super.onClose();
  }

  void starWorkout(String exerciseId, int exerciseDuration) {
    final now = DateTime.now().toUtc().microsecondsSinceEpoch;
    // logic now - exerciseDuration
    final startStream = now - (exerciseDuration * 1000000);
    var currentSecond = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSecondDataItem = SessionDataItem(
        second: currentSecond,
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        devices: List.from(currentSecondDataItem.devices),
      );

      sessionModel.data.add(currentSecondDataItem);
      if (isStartWorkout.value == false) {
        saveToJSON(connectedDeviceId.value, startStream);
        uploadData();
        currentSecond = 0;
        timer.cancel();
      }

      currentSecondDataItem.devices.clear();
      currentSecond++;
    });
  }

  // void dummyDebugging() {
  //   int counter = 0;
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     debugPrint("Starting in $counter");
  //     if (counter == 3) {
  //       isStartWorkout.toggle();
  //       debugPrint("============================================\n"
  //           "Date Time : ${DateTime.now().toString()}\n"
  //           "============================================");
  //       dummyWorkout();
  //       timer.cancel();
  //     }
  //     counter++;
  //   });
  // }

  // void dummyWorkout() {
  //   int currentSecond = 0;
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     currentSecondDataItem = SessionDataItem(
  //       second: currentSecond,
  //       timeStamp: DateTime.now().microsecondsSinceEpoch,
  //       devices: List.from(currentSecondDataItem.devices),
  //     );
  //     if (currentSecond == 900) {
  //       sessionModel = SessionModel(
  //           exerciseId: '15 Minutes Workout',
  //           startTime: DateTime.now().microsecondsSinceEpoch - (900 * 1000000),
  //           endTime: DateTime.now().microsecondsSinceEpoch,
  //           timelines: [],
  //           data: List.from(sessionModel.data));
  //       saveToJSON(identifier, 900);
  //       print('${sessionModel.exerciseId} Workout Saved');
  //       Get.snackbar(
  //         'Saved',
  //         '${sessionModel.exerciseId} Workout Saved',
  //         colorText: isDarkMode ? Colors.white : Colors.black,
  //         backgroundColor: isDarkMode ? Colors.black : Colors.white,
  //       );
  //     }
  //     if (currentSecond == 1800) {
  //       sessionModel = SessionModel(
  //           exerciseId: '30 Minutes Workout',
  //           startTime: DateTime.now().microsecondsSinceEpoch - (1800 * 1000000),
  //           endTime: DateTime.now().microsecondsSinceEpoch,
  //           timelines: [],
  //           data: List.from(sessionModel.data));
  //       saveToJSON(identifier, 1800);
  //       print('${sessionModel.exerciseId} Workout Saved');
  //       Get.snackbar(
  //         'Saved',
  //         '${sessionModel.exerciseId} Workout Saved',
  //         colorText: isDarkMode ? Colors.white : Colors.black,
  //         backgroundColor: isDarkMode ? Colors.black : Colors.white,
  //       );
  //     }
  //     if (currentSecond == 2700) {
  //       sessionModel = SessionModel(
  //           exerciseId: '45 Minutes Workout',
  //           startTime: DateTime.now().microsecondsSinceEpoch - (2700 * 1000000),
  //           endTime: DateTime.now().microsecondsSinceEpoch,
  //           timelines: [],
  //           data: List.from(sessionModel.data));
  //       saveToJSON(identifier, 2700);
  //       print('${sessionModel.exerciseId} Workout Saved');
  //       Get.snackbar(
  //         'Saved',
  //         '${sessionModel.exerciseId} Workout Saved',
  //         colorText: isDarkMode ? Colors.white : Colors.black,
  //         backgroundColor: isDarkMode ? Colors.black : Colors.white,
  //       );
  //     }
  //     if (currentSecond == 3600) {
  //       sessionModel = SessionModel(
  //           exerciseId: '60 Minutes Workout',
  //           startTime: DateTime.now().microsecondsSinceEpoch - (3600 * 1000000),
  //           endTime: DateTime.now().microsecondsSinceEpoch,
  //           timelines: [],
  //           data: List.from(sessionModel.data));
  //       saveToJSON(identifier, 3600);
  //       print('${sessionModel.exerciseId} Workout Saved');
  //       Get.snackbar(
  //         'Saved',
  //         '${sessionModel.exerciseId} Workout Saved',
  //         colorText: isDarkMode ? Colors.white : Colors.black,
  //         backgroundColor: isDarkMode ? Colors.black : Colors.white,
  //       );
  //     }
  //     sessionModel.data.add(currentSecondDataItem);
  //     currentSecondDataItem.devices.clear();
  //     currentSecond++;
  //   });
  // }

  void streamWhenReady(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );

    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);
    print('=====================================\n'
        'Device Name : ${detectedDevices[0]['name']}\n'
        'Available Types : \n');
    for (var element in availableTypes) {
      print('${element.toString()}\n');
    }
    print('=====================================');

    if (availableTypes.contains(PolarDataType.hr)) {
      Stream<PolarStreamingData<PolarHrSample>> hrSample =
          polar.startHrStreaming(deviceId);
      StreamSubscription hrSubscription = hrSample.listen((hrData) {
        heartRate.value = hrData.samples.last.hr.toString();

        if (isStartWorkout.value == true) {
          bool hasHrDevice = currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.hr');

          if (!hasHrDevice) {
            if (hrData.samples.last.rrsMs.isEmpty) {
              currentSecondDataItem.devices.add(
                SessionDataItemDevice(
                  type: 'PolarDataType.hr',
                  identifier: deviceId,
                  value: [
                    {'hr': hrData.samples.last.hr}
                  ],
                ),
              );
            } else {
              currentSecondDataItem.devices.add(
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
      availableDevices.add(hrSample);
      availableSubscriptions.add(hrSubscription);
    }
    if (availableTypes.contains(PolarDataType.acc)) {
      Stream<PolarStreamingData<PolarAccSample>> accData =
          polar.startAccStreaming(deviceId);
      StreamSubscription accSubscription = accData.listen((accData) {
        if (isStartWorkout.value == true) {
          bool hasAccDevice = currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.acc');

          if (!hasAccDevice) {
            currentSecondDataItem.devices.add(
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
      availableDevices.add(accData);
      availableSubscriptions.add(accSubscription);
    }
    if (availableTypes.contains(PolarDataType.ecg)) {
      Stream<PolarStreamingData<PolarEcgSample>> ecgData =
          polar.startEcgStreaming(deviceId);
      StreamSubscription ecgSubscription = ecgData.listen((ecgData) {
        if (isStartWorkout.value == true) {
          bool hasEcgDevice = currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.ecg');

          if (!hasEcgDevice) {
            currentSecondDataItem.devices.add(
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
      availableDevices.add(ecgData);
      availableSubscriptions.add(ecgSubscription);
    }
    if (availableTypes.contains(PolarDataType.gyro)) {
      Stream<PolarStreamingData<PolarGyroSample>> gyroData =
          polar.startGyroStreaming(deviceId);
      StreamSubscription gyroSubscription = gyroData.listen((gyroData) {
        // calcute how much gyro data is available in a second

        if (isStartWorkout.value == true) {
          bool hasGyroDevice = currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.gyro');

          if (!hasGyroDevice) {
            currentSecondDataItem.devices.add(
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
      availableDevices.add(gyroData);
      availableSubscriptions.add(gyroSubscription);
    }
    if (availableTypes.contains(PolarDataType.magnetometer)) {
      Stream<PolarStreamingData<PolarMagnetometerSample>> magnetometerData =
          polar.startMagnetometerStreaming(deviceId);
      StreamSubscription magnetometerSubscription =
          magnetometerData.listen((magnetometerData) {
        if (isStartWorkout.value == true) {
          bool hasMagnetometerDevice = currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.magnetometer');

          if (!hasMagnetometerDevice) {
            currentSecondDataItem.devices.add(
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
      availableDevices.add(magnetometerData);
      availableSubscriptions.add(magnetometerSubscription);
    }
    if (availableTypes.contains(PolarDataType.ppg)) {
      Stream<PolarStreamingData<PolarPpgSample>> ppgData =
          polar.startPpgStreaming(deviceId);
      StreamSubscription ppgSubscription = ppgData.listen((ppgData) {
        if (isStartWorkout.value == true) {
          bool hasPpgDevice = currentSecondDataItem.devices
              .any((element) => element.type == 'PolarDataType.ppg');

          if (!hasPpgDevice) {
            currentSecondDataItem.devices.add(
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
      availableDevices.add(ppgData);
      availableSubscriptions.add(ppgSubscription);
    }
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
          colorText: isDarkMode ? Colors.white : Colors.black,
          backgroundColor: isDarkMode
              ? ColorPalette.darkContainer.withOpacity(0.9)
              : ColorPalette.lightContainer.withOpacity(0.9));
    }).catchError((error) {
      debugPrint("============================================\n"
          "Error connecting $error"
          "============================================");
      polar.disconnectFromDevice(deviceId);
      Get.back();
      Get.snackbar('Error', 'Waduh... Reconnect lagi',
          colorText: isDarkMode ? Colors.white : Colors.black,
          backgroundColor: isDarkMode
              ? ColorPalette.darkContainer.withOpacity(0.9)
              : ColorPalette.lightContainer.withOpacity(0.9));
    });
  }

  // disconnect from polar device by device id
  void disconnectDevice(String deviceId) {
    _streamCancelation();
    polar.disconnectFromDevice(deviceId);
    polar.deviceDisconnected.last;
  }

  void streamResume() {
    for (var element in availableSubscriptions) {
      element.resume();
    }
  }

  void streamPause() {
    for (var element in availableSubscriptions) {
      element.pause();
    }
  }

  Future<void> _streamCancelation() async {
    for (var element in availableSubscriptions) {
      await element.cancel();
    }
  }

  void saveToJSON(String deviceId, int startStream) async {
    // var json = sessionModel.toJson();
    // JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    // var stringJson = prettyPrint.convert(json);
    // debugPrint("=============================\n"
    //     "JSON DATA\n"
    //     "$stringJson"
    //     "\n=============================");

    String jsonString = jsonEncode(sessionModel);

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
        jsonEncode(sessionModel),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        Get.snackbar('Alhamdulillah', 'Success upload data to server',
            colorText: isDarkMode ? Colors.white : Colors.black,
            backgroundColor: isDarkMode
                ? ColorPalette.darkContainer.withOpacity(0.9)
                : ColorPalette.lightContainer.withOpacity(0.9));
      } else {
        final dynamic jsonResponse = jsonDecode(response.body);
        debugPrint(jsonResponse['message']);
        Get.snackbar('Astaghfirullah', 'Failed upload data to server',
            colorText: isDarkMode ? Colors.white : Colors.black,
            backgroundColor: isDarkMode
                ? ColorPalette.darkContainer.withOpacity(0.9)
                : ColorPalette.lightContainer.withOpacity(0.9));
      }
    } catch (e) {
      Get.snackbar('Astaghfirullah', 'Internet connection error',
          colorText: isDarkMode ? Colors.white : Colors.black,
          backgroundColor: isDarkMode
              ? ColorPalette.darkContainer.withOpacity(0.9)
              : ColorPalette.lightContainer.withOpacity(0.9));
    }
  }
}
