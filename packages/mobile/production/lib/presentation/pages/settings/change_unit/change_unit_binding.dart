import 'package:get/get.dart';

import 'change_unit_controller.dart';

class ChangeUnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeUnitController>(() => ChangeUnitController());
  }
}
