import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

import 'polar_service.dart';

class BluetoothService extends GetxController {
  // call polar service
  final FlutterBluePlus flutterBluePlus = FlutterBluePlus();
  final isBluetoothOn = false.obs;
  final isConnectedDevice = false.obs;

  @override
  void onReady() {
    getBluetoothPermission();
    getBluetoothStatus();
    super.onReady();
  }

  Future<void> getBluetoothStatus() async {
    FlutterBluePlus.adapterState.listen((event) async {
      if (event == BluetoothAdapterState.on) {
        isBluetoothOn.value = true;
      } else {
        isBluetoothOn.value = false;
      }
    });
    update();
  }

  void getBluetoothPermission() {
    PolarService().polar.requestPermissions();
    update();
  }

  Future<void> turnOnBluetooth() async {
    if (isBluetoothOn.value == false) {
      await FlutterBluePlus.turnOn();
    }
  } 
}
