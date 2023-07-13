import 'package:get/get.dart';
import 'package:polar_hr_devices/services/internet_service.dart';

class HistoryDetailController extends GetxController {
  final String title = 'History Detail';
  final argument = Get.arguments;
  @override
  void onReady() {
    InternetService().fetchReport(argument);
    print('argument: $argument');
    super.onReady();
  }
}
