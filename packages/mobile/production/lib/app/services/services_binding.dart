import 'package:get/get.dart';

import 'bluetooth_service.dart';
import 'polar_service.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolarService>(() => PolarService());
    Get.lazyPut<BluetoothService>(() => BluetoothService());
  }
}
