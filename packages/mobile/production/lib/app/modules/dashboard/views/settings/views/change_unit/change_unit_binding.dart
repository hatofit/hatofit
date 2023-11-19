import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/change_unit/change_unit_controller.dart';

class ChangeUnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeUnitController>(() => ChangeUnitController());
  }
}
