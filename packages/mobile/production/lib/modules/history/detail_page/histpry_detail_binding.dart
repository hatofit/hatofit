import 'package:get/get.dart';
import 'package:hatofit/modules/history/detail_page/history_detail_controller.dart';

class HistoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryDetailController>(() => HistoryDetailController());
  }
}
