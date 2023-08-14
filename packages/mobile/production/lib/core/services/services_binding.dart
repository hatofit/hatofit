import 'package:get/get.dart';
import 'package:polar_hr_devices/core/services/bluetooth_service.dart';
import 'package:polar_hr_devices/core/services/polar_service.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolarService>(() => PolarService());
    Get.lazyPut<BluetoothService>(() => BluetoothService());
  }
}
