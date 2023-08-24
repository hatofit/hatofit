import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:polar/polar.dart';

class BluetoothService extends GetxService {
  final isBluetoothOn = false.obs;
  final isConnectedDevice = false.obs;

  Polar? polar;

  Future<BluetoothService> init() async {
    polar = Polar();
    return this;
  }

  @override
  void onInit() {
    getBluetoothPermission();
    getBluetoothStatus();
    super.onInit();
  }

  Future<void> getBluetoothPermission() async {
    await polar!.requestPermissions();
  }

  Future<void> getBluetoothStatus() async {
    FlutterBluePlus.adapterState.listen((event) async {
      if (event == BluetoothAdapterState.on) {
        isBluetoothOn.value = true;
      } else {
        isBluetoothOn.value = false;
      }
    });
  }

  Future<void> turnOnBluetooth() async {
    if (isBluetoothOn.value == false) {
      await FlutterBluePlus.turnOn();
    }
  }
}
