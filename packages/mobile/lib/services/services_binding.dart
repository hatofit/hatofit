import 'package:get/get.dart';
import 'package:polar_hr_devices/services/bluetooth_service.dart';
import 'package:polar_hr_devices/services/polar_service.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolarService>(() => PolarService());
    Get.lazyPut<BluetoothService>(() => BluetoothService());
  }
}
