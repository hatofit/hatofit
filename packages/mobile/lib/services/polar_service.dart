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
  final detectedDevices = List<Map<String, dynamic>>.empty(growable: true);

  final _isDevelopment = false.obs;
  final isStartWorkout = false.obs;
  @override
  void onReady() {
    _isDevelopment.toggle();
    connectDevice('C16E3B2F');
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

  void dummyDebugging() {
    int counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      debugPrint("Starting in $counter");
      if (counter == 3) {
        isStartWorkout.toggle();
        debugPrint("============================================\n"
            "Date Time : ${DateTime.now().toString()}\n"
            "============================================");
        dummyWorkout(); // Start dummyWorkout after streamWhenReady
        timer.cancel();
      }
      counter++;
    });
  }

  void dummyWorkout() {
    int currentSecond = 0;
    int duration = 30;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentSecondDataItem = SessionDataItem(
        second: currentSecond,
        timeStamp: DateTime.now().microsecondsSinceEpoch,
        devices: List.from(currentSecondDataItem
            .devices), // Create a new list to avoid modifying the original list
      );

      sessionModel.data.add(currentSecondDataItem);
      if (currentSecond <= duration) {
        var json = sessionModel.toJson();
        JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
        var stringJson = prettyPrint.convert(json);
        debugPrint("=============================\n"
            "SessionModel $currentSecond\n"
            "$stringJson\n"
            "=============================\n");
      }
      if (currentSecond == duration) {
        saveToJSON('deviceId',
            DateTime.now().microsecondsSinceEpoch - duration * 1000000);
      }
      currentSecondDataItem.devices.clear();
      currentSecond++;
    });
  }

  void streamWhenReady(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );

    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);

    dummyDebugging();

    if (availableTypes.contains(PolarDataType.hr)) {
      Stream<PolarStreamingData<PolarHrSample>> hrSample =
          polar.startHrStreaming(deviceId);
      StreamSubscription hrSubscription = hrSample.listen((hrData) {
        heartRate.value = hrData.samples.last.hr.toString();

        if (isStartWorkout.value == true) {
          bool hasHrDevice = currentSecondDataItem.devices
              .any((element) => element.type == PolarDataType.hr);

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

  // void starWorkout(String exerciseId, int exerciseDuration) {
  //   final now = DateTime.now().toUtc().microsecondsSinceEpoch;
  //   // logic now - exerciseDuration
  //   final startStream = now - (exerciseDuration * 1000000);
  //   var currentSecond = 0;
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     dataModel.add(DataModel(currentSecond, now, deviceModelList));

  //     if (isStartWorkout.value == false) {
  //       sessionModel =
  //           SessionModel(exerciseId, startStream, now, [], dataModel);
  //       saveToJSON(connectedDeviceId.value, startStream);

  //       uploadData();
  //       timer.cancel();
  //     }

  //     currentSecond++;
  //   });
  // }

  void saveToJSON(String deviceId, int startStream) async {
    var json = sessionModel.toJson();
    JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    var stringJson = prettyPrint.convert(json);
    debugPrint("=============================\n"
        "JSON DATA\n"
        "$stringJson"
        "\n=============================");

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
