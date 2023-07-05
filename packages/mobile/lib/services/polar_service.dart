import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/data/polar_dict.dart';
import 'package:polar_hr_devices/models/session_model.dart';
import 'package:polar_hr_devices/services/bluetooth_service.dart';

class PolarService extends GetxController {
  final _getConnect = GetConnect();
  final polar = Polar();
  final screenHeight = Get.height;
  final screenWidth = Get.width;
  var heartRate = '--'.obs;
  var connectedDeviceId = 'No Device'.obs;
  final List<Map<String, dynamic>> detectedDevices =
      List<Map<String, dynamic>>.empty(growable: true);
  final bluetoothService = Get.find<BluetoothService>();

  final dataModel = [DataModel(0, 0, [])];
  final deviceModelList = [DeviceModel('', '', [])];
  var sessionModel = SessionModel('exerciseId', 0, 0, [], []);

  var isStartWorkout = false.obs;
  StreamSubscription<PolarStreamingData<PolarHrSample>>? hrSubscription;
  StreamSubscription<PolarStreamingData<PolarGyroSample>>? gyroSubscription;
  StreamSubscription<PolarStreamingData<PolarPpgSample>>? ppgSubscription;
  StreamSubscription<PolarStreamingData<PolarPpiSample>>? ppiSubscription;
  StreamSubscription<PolarStreamingData<PolarMagnetometerSample>>?
      magnetometerSubscription;
  StreamSubscription<PolarStreamingData<PolarAccSample>>? accSubscription;
  StreamSubscription<PolarStreamingData<PolarEcgSample>>? ecgSubscription;

  @override
  void onReady() {
    scanPolarDevices();
    initState();
    super.onReady();
  }

  void initState() {
    polar.batteryLevel.listen((e) => print('Battery: ${e.level}'));
    polar.deviceConnecting.listen((_) => print('Device connecting'));
    polar.deviceConnected.listen((_) => print('Device connected'));
    polar.deviceDisconnected.drain();
    update();
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
        debugPrint(detectedDevices.toString());
      }
      update();
    });
  }

  //  connect to polar device by device id
  Future<void> connectDevice(String deviceId) async {
    bluetoothService.isConnectedDevice.toggle();
    connectedDeviceId.value = deviceId;
    await polar.connectToDevice(deviceId);
    await polar.deviceConnected.first;
    await streamWhenReady(deviceId);
  }

  // disconnect from polar device by device id
  Future<void> disconnectDevice(String deviceId) async {
    bluetoothService.isConnectedDevice.toggle();
    await hrSubscription!.cancel();
    streamCancelation();
    await polar.disconnectFromDevice(deviceId);
    await polar.deviceDisconnected.first;
    connectedDeviceId.value = 'Device disconnected';
  }

  void streamCancelation() async {
    await gyroSubscription!.cancel();
    await ppgSubscription!.cancel();
    await ppiSubscription!.cancel();
    await magnetometerSubscription!.cancel();
    await accSubscription!.cancel();
    await ecgSubscription!.cancel();
    isStartWorkout.value = false;
  }
PolarStreamingData? data;
  void starWorkout(String exerciseId, int exerciseDuration) {
    isStartWorkout.value = true;
    final now = DateTime.now().toUtc().microsecondsSinceEpoch;
    // logic now - exerciseDuration
    final startStream = now - (exerciseDuration * 1000000);
    debugPrint(' DEVICE ID : ${connectedDeviceId.value}');
    var counter = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      dataModel.add(DataModel(counter, now, deviceModelList));
      polar.deviceDisconnected.listen((event) {
        timer.cancel();
      });
      debugPrint('Start Workout');
      if (isStartWorkout.value == false) {
        debugPrint('Save Data');

        sessionModel =
            SessionModel(exerciseId, startStream, now, [], dataModel);
        saveToJSON(connectedDeviceId.value, startStream);

        uploadData();
        timer.cancel();
      }
      debugPrint('now: $now');
      debugPrint('startStream: $startStream');

      counter++;
    });
  }

  // get Available Features Data by device id
  Future<void> streamWhenReady(String deviceId) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );

    final availableTypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);

    bluetoothService.isBluetoothOn.value = true;

    if (availableTypes.contains(PolarDataType.hr)) {
      hrSubscription = polar.startHrStreaming(deviceId).listen((hrData) {
        heartRate.value = hrData.samples.first.hr.toString();
        deviceModelList.add(DeviceModel('PolarDataType.hr', deviceId, [
          {
            'hr': hrData.samples.first.hr,
            'rrsMs': hrData.samples.first.rrsMs,
          }
        ]));
      });
      if (availableTypes.contains(PolarDataType.gyro)) {
        gyroSubscription =
            polar.startGyroStreaming(deviceId).listen((gyroData) {
          if (isStartWorkout.value == true) {
            debugPrint('Received GYRO');
            deviceModelList.add(DeviceModel('PolarDataType.acc', deviceId, [
              {
                'x': gyroData.samples.first.x,
                'y': gyroData.samples.first.y,
                'z': gyroData.samples.first.z,
              }
            ]));
          } else {
            gyroSubscription!.cancel();
          }
        });
      }
      if (availableTypes.contains(PolarDataType.acc)) {
        accSubscription = polar.startAccStreaming(deviceId).listen((accData) {
          if (isStartWorkout.value == true) {
            debugPrint('Received ACC');
            deviceModelList.add(DeviceModel('PolarDataType.acc', deviceId, [
              {
                'timeStamp': accData.samples.first.timeStamp,
                'x': accData.samples.first.x,
                'y': accData.samples.first.y,
                'z': accData.samples.first.z,
              }
            ]));
          } else {
            accSubscription!.cancel();
          }
        });
      }
      if (availableTypes.contains(PolarDataType.ecg)) {
        ecgSubscription = polar.startEcgStreaming(deviceId).listen((ecgData) {
          if (isStartWorkout.value == true) {
            debugPrint('Received ECG');
            deviceModelList.add(DeviceModel('PolarDataType.ecg', deviceId, [
              {
                'timeStamp': ecgData.samples.first.timeStamp,
                'voltage': ecgData.samples.first.voltage,
              }
            ]));
          } else {
            ecgSubscription!.cancel();
          }
        });
      }
      if (availableTypes.contains(PolarDataType.magnetometer)) {
        magnetometerSubscription = polar
            .startMagnetometerStreaming(deviceId)
            .listen((magnetometerData) {
          if (isStartWorkout.value == true) {
            debugPrint('Received ECG');
            deviceModelList
                .add(DeviceModel('PolarDataType.magnetometer', deviceId, [
              {
                'timeStamp': magnetometerData.samples.first.timeStamp,
                'x': magnetometerData.samples.first.x,
                'y': magnetometerData.samples.first.y,
                'z': magnetometerData.samples.first.z,
              }
            ]));
          } else {
            magnetometerSubscription!.cancel();
          }
        });
      }
      if (availableTypes.contains(PolarDataType.ppg)) {
        ppgSubscription = polar.startPpgStreaming(deviceId).listen((ppgData) {
          if (isStartWorkout.value == true) {
            debugPrint('Received PPG');
            deviceModelList.add(DeviceModel('PolarDataType.ppg', deviceId, [
              {
                'timeStamp': ppgData.samples.first.timeStamp,
                'channelSamples': ppgData.samples.first.channelSamples,
              }
            ]));
          } else {
            ppgSubscription!.cancel();
          }
        });
      }
      if (availableTypes.contains(PolarDataType.ppi)) {
        ppiSubscription = polar.startPpiStreaming(deviceId).listen((ppiData) {
          if (isStartWorkout.value == true) {
            debugPrint('Received PPI');
            deviceModelList.add(DeviceModel('PolarDataType.ppi', deviceId, [
              {
                'ppi': ppiData.samples.first.ppi,
                'blockerBit': ppiData.samples.first.blockerBit,
                'errorEstimate': ppiData.samples.first.errorEstimate,
                'hr': ppiData.samples.first.hr,
                'skinContactStatus': ppiData.samples.first.skinContactStatus,
                'skinContactSupported':
                    ppiData.samples.first.skinContactSupported,
              }
            ]));
          } else {
            ppiSubscription!.cancel();
          }
        });
      }
    }
  }

  void saveToJSON(String deviceId, int startStream) async {
    // var json = sessionModel.toJson();
    // JsonEncoder prettyPrint = const JsonEncoder.withIndent('  ');
    // var stringJson = prettyPrint.convert(json);
    // debugPrint(stringJson);

    String jsonString = jsonEncode(sessionModel);

    // save to file to local storage
    Directory? directory = await getExternalStorageDirectory();
    if (directory != null) {
      String path = '${directory.path}/log-$deviceId-$startStream.json';
      await File(path).writeAsString(jsonString);
    }
  }

  Future<void> uploadData() async {
    try {
      final response = await _getConnect.post(
        'http://192.168.93.169:3000/api/session',
        jsonEncode(sessionModel),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        debugPrint('success');
        const GetSnackBar(
          title: 'Alhamdulillah',
          message: 'Success upload data to server',
        );
      } else {
        debugPrint('failed');
        final dynamic jsonResponse = jsonDecode(response.body);
        debugPrint(jsonResponse['message']);
        const GetSnackBar(
          title: 'Astaghfirullah',
          message: 'Failed upload data to server',
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      const GetSnackBar(
        title: 'Astaghfirullah',
        message: 'Internet connection error',
      );
    }
  }
}
