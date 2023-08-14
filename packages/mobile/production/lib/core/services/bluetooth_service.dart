import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/core/services/polar_service.dart';

class BluetoothService extends GetxController {
  // call polar service
  final FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
  final isBluetoothOn = false.obs;
  final isConnectedDevice = false.obs;

  @override
  void onReady() {
    getBluetoothPermission();
    getBluetoothStatus();
    super.onReady();
  }

  Future<void> getBluetoothStatus() async {
    flutterBluePlus.state.listen((event) async {
      isBluetoothOn.value = await flutterBluePlus.isOn;
    });
    update();
  }

  void getBluetoothPermission() {
    PolarService().polar.requestPermissions();
    update();
  }

  Future<void> turnOnBluetooth() async {
    if (isBluetoothOn.value == false) {
      await flutterBluePlus.turnOn();
    }
  }

  Future<void> turnOffBluetooth() async {
    if (isBluetoothOn.value == true) {
      await flutterBluePlus.turnOff();
    }
  }
}
