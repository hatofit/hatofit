import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BluetoothController extends GetxController {
  final Rx<BluetoothState> _bluetoothState = BluetoothState.unknown.obs;
  final FlutterBluePlus _flutterBluePlus = FlutterBluePlus.instance;

  final isConnected = false.obs;

  BluetoothDevice? device;

  Rx<BluetoothState> get bluetoothState => _bluetoothState;
  FlutterBluePlus get flutterBluePlus => _flutterBluePlus;

  Future<void> turnOn() async {
    if (!await _flutterBluePlus.isOn) {
      await _flutterBluePlus.turnOn();
      _bluetoothState.value = await _flutterBluePlus.state.first;
    }
  }

  @override
  void onInit() {

    super.onInit();
    _bluetoothState.bindStream(_flutterBluePlus.state);
  }
}
