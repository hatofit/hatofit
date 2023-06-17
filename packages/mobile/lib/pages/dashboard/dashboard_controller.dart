import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:polar/polar.dart';
import 'package:polar_hr_devices/data/polar_image_dict.dart';
import 'package:polar_hr_devices/widget/detected_devices_modal.dart';

class DashboardController extends GetxController {
  final isBluetoothOn = false.obs;
  final isConnectedDevice = false.obs;
  final List<PolarDeviceInfo> detectedDevices = <PolarDeviceInfo>[].obs;
  final List<String> deviceNameList = <String>[].obs;
  final List<String> imageDictList = <String>[].obs;
  final List<double> distanceList = <double>[].obs;

  var hrData = 0.obs;
  final polar = Polar();
  final storage = GetStorage();

  final FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
  final double screenHeight = Get.height;
  final double screenWidth = Get.width;
  var tabIndex = 0;

  @override
  void onInit() {
    super.onInit();
    getBluetoothStatus();
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
      double ratio = detectedDevices[i].rssi.toDouble() / -59;
      double distanceList = 0;
      if (ratio < 1.0) {
        distanceList = pow(ratio, 10).toDouble();
      } else {
        distanceList = (0.89976) * pow(ratio, 7.7095) + 0.111;
      }
      distanceList = double.parse(distanceList.toStringAsFixed(2));
      this.distanceList.add(distanceList);
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
    if (availabletypes.contains(PolarDataType.hr)) {
      polar.startHrStreaming(deviceId).listen((e) {
        hrData.value = e.samples.map((e) => e.hr).first;
      });
    }
    if (availabletypes.contains(PolarDataType.ecg)) {
      polar.startEcgStreaming(deviceId).listen((e) {
        debugPrint('ECG data received');
      });
    }
    if (availabletypes.contains(PolarDataType.acc)) {
      polar.startAccStreaming(deviceId).listen((e) {
        debugPrint('ACC data received');
      });
    }
  }

  void disconnectDevice(String deviceId) {
    polar.disconnectFromDevice(deviceId);
    storage.remove('lastConnectedDeviceID');
    Get.back();
  }

  void getBluetoothStatus() async {
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
