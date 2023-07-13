import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/history/detail_page/history_detail_controller.dart';

class HistoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryDetailController>(() => HistoryDetailController());
  }
}
