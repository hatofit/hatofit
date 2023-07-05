import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/services/polar_service.dart';

class BluetoothService extends GetxController {
  // call polar service
  final FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
  var isBluetoothOn = false.obs;
  var isConnectedDevice = false.obs;

  @override
  void onReady() {
    getBluetoothPermission();
    getBluetoothStatus();
    super.onReady();
  }


  getBluetoothStatus() async {
    isBluetoothOn.value = await flutterBluePlus.isOn;
    update();
  }

  getBluetoothPermission() {
    PolarService().polar.requestPermissions();
    update();
  }

  turnOnBluetooth() async {
    if (isBluetoothOn.value == false) {
      await flutterBluePlus.turnOn();
      isBluetoothOn.value = await flutterBluePlus.isOn;
    }
  }

  turnOffBluetooth() async {
    if (isBluetoothOn.value == true) {
      await flutterBluePlus.turnOff();
      isBluetoothOn.value = await flutterBluePlus.isOn;
    }
  }
}
