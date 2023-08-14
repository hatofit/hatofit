import 'package:get/get.dart';

import 'device_integration_controller.dart';
class DeviceIntegrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceIntegrationController>(() => DeviceIntegrationController());
  }
}
