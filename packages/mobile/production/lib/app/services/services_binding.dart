import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/polar_service.dart';

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PolarService>(() => PolarService());
    Get.lazyPut<BluetoothService>(() => BluetoothService());
  }
}
