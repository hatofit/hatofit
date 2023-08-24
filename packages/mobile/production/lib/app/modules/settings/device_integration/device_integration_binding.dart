import 'package:get/get.dart';
import 'package:hatofit/app/modules/settings/device_integration/device_integration_controller.dart';

class DeviceIntegrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeviceIntegrationController>(
        () => DeviceIntegrationController());
  }
}
