import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart'; 

class ServicesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BluetoothService>(() => BluetoothService());
  }
}
