import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/data/polar_image_dict.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/widget/appBar/detected_devices_modal.dart';

class DashboardController extends GetxController {
  final isBluetoothOn = false.obs;
  final isConnectedDevice = false.obs;
  final List<PolarDeviceInfo> detectedDevices = <PolarDeviceInfo>[].obs;
  final List<String> deviceNameList = <String>[].obs;
  final List<String> imageDictList = <String>[].obs;

  var hrValue = '--'.obs;
  final polar = Polar();

  final FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
  final double screenHeight = Get.height;
  final double screenWidth = Get.width;
  var tabIndex = 3;

  @override
  void onInit() {
    getBluetoothStatus();
    super.onInit();
  }

  @override
  void onClose() {
    // polar.disconnectFromDevice();
    super.onClose();
  }

  var ecgData = <Map<String, dynamic>>[];
  var accData = <Map<String, dynamic>>[];
  var ppgData = <Map<String, dynamic>>[];
  var gyroData = <Map<String, dynamic>>[];
  var magnetometerData = <Map<String, dynamic>>[];
  var hrData = <Map<String, dynamic>>[];
  Future<void> streamWhenReady(String deviceId) async {
    Get.back();
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == deviceId &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availabletypes =
        await polar.getAvailableOnlineStreamDataTypes(deviceId);
    if (availabletypes.isNotEmpty) {
      Get.back();
      isConnectedDevice.value = true;
      storage.write('lastConnectedDeviceID', deviceId);
      update();
    }

    if (availabletypes.contains(PolarDataType.ecg)) {
      polar.startEcgStreaming(deviceId).listen((e) {
        final ecgSample = {
          'voltage': e.samples.map((e) => e.voltage).first.toString(),
          'timeStamp': e.samples.map((e) => e.timeStamp).first.toString(),
        };
        ecgData.add(ecgSample);
      });
    }

    if (availabletypes.contains(PolarDataType.acc)) {
      polar.startAccStreaming(deviceId).listen((e) {
        final accSample = {
          'x': e.samples.map((e) => e.x).first.toString(),
          'y': e.samples.map((e) => e.y).first.toString(),
          'z': e.samples.map((e) => e.z).first.toString(),
          'timeStamp': e.samples.map((e) => e.timeStamp).first.toString(),
        };
        accData.add(accSample);
      });
    }

    if (availabletypes.contains(PolarDataType.ppg)) {
      polar.startPpgStreaming(deviceId).listen((e) {
        final ppgSample = {
          'channelSamples':
              e.samples.map((e) => e.channelSamples).first.toString(),
          'timeStamp': e.samples.map((e) => e.timeStamp).first.toString(),
        };
        ppgData.add(ppgSample);
      });
    }

    if (availabletypes.contains(PolarDataType.gyro)) {
      polar.startGyroStreaming(deviceId).listen((e) {
        final gyroSample = {
          'x': e.samples.map((e) => e.x).first.toString(),
          'y': e.samples.map((e) => e.y).first.toString(),
          'z': e.samples.map((e) => e.z).first.toString(),
          'timeStamp': e.samples.map((e) => e.timeStamp).first.toString(),
        };
        gyroData.add(gyroSample);
      });
    }

    if (availabletypes.contains(PolarDataType.magnetometer)) {
      polar.startMagnetometerStreaming(deviceId).listen((e) {
        final magnetometerSample = {
          'x': e.samples.map((e) => e.x).first.toString(),
          'y': e.samples.map((e) => e.y).first.toString(),
          'timeStamp': e.samples.map((e) => e.timeStamp).first.toString(),
        };
        magnetometerData.add(magnetometerSample);
      });
    }

    if (availabletypes.contains(PolarDataType.hr)) {
      polar.startHrStreaming(deviceId).listen((e) {
        hrValue.value = e.samples.map((e) => e.hr).first.toString();
        final hrSample = {
          'hr': e.samples.map((e) => e.hr).first.toString(),
          'rrsMs': e.samples.map((e) => e.rrsMs).first.toString(),
        };
        hrData.add(hrSample);
        svJson();
      });
    }
  }

  Future<void> svJson() async {
    await Future.delayed(const Duration(seconds: 10));

    final allData = {
      'ecgData': ecgData,
      'accData': accData,
      'ppgData': ppgData,
      'gyroData': gyroData,
      'magnetometerData': magnetometerData,
      'hrData': hrData,
    };
    String jsonString = jsonEncode(allData);

    Directory? externalStorageDir = await getExternalStorageDirectory();
    if (externalStorageDir != null) {
      String filePath = '${externalStorageDir.path}/data.json';
      await File(filePath).writeAsString(jsonString);
    } else {}
  }

  void showConnectingDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          width: 100,
          child: Lottie.asset('assets/bleConnecting.json',
              frameRate: FrameRate(35), repeat: false),
        );
      },
    );
  }

  void getDeviceInfo() {
    for (var i = 0; i < detectedDevices.length; i++) {
      if (detectedDevices[i].name.contains('H10')) {
        imageDictList.add(PolarImageDict.polarH10);
        deviceNameList.add('Polar H10');
      } else if (detectedDevices[i].name.contains('H9')) {
        imageDictList.add(PolarImageDict.polarH9);
        deviceNameList.add('Polar H9');
      } else if (detectedDevices[i].name.contains('OH1')) {
        imageDictList.add(PolarImageDict.polarOH1);
        deviceNameList.add('Polar OH1');
      } else if (detectedDevices[i].name.contains('Sense')) {
        imageDictList.add(PolarImageDict.polarVeritySense);
        deviceNameList.add('Polar Verity Sense');
      }
    }
    update();
  }

  void scanPolarDevices() async {
    polar.searchForDevice().listen((data) {
      bool isDeviceAlreadyDetected = detectedDevices.any((data) =>
          data.address == data.address || data.deviceId == data.deviceId);
      if (!isDeviceAlreadyDetected) {
        detectedDevices.add(data);
        getDeviceInfo();
        debugPrint('Device detected: ${data.name}');
      }
    });
    update();
  }

  void connectToDevice(int index) async {
    if (await flutterBluePlus.isOn) {
      final deviceId = detectedDevices[index].deviceId;
      polar.connectToDevice(deviceId);
      showConnectingDialog();
      polar.deviceConnected.listen((_) => streamWhenReady(deviceId));
    }
    update();
  }

  void disconnectDevice(String deviceId) {
    polar.disconnectFromDevice(deviceId);
    storage.remove('lastConnectedDeviceID');
    Get.back();
  }

  void getBluetoothStatus() async {
    polar.batteryLevel;
    polar
        .requestPermissions()
        .then((value) => flutterBluePlus.state.listen((event) {
              if (event == BluetoothState.on) {
                isBluetoothOn.value = true;
                isConnectedDevice.value = false;
                scanPolarDevices();
              } else {
                isConnectedDevice.value = false;
                isBluetoothOn.value = false;
              }
            }));

    update();
  }

  void turnOnBluetooth() async {
    await flutterBluePlus.turnOn();
    await flutterBluePlus.state
        .firstWhere((state) => state == BluetoothState.on);
    getBluetoothStatus();
    DetectedDevicesModal().showModal();
  }

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
