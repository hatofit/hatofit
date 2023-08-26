import 'package:get/get.dart';
import 'package:hatofit/app/modules/history/history_controller.dart';
import 'package:hatofit/app/services/internet_service.dart';
import 'package:hatofit/utils/debug_logger.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());

  final historyList = [].obs;

  final history = Get.find<HistoryController>();
  final prov = Get.find<InternetService>();
  final report = [].obs;

  final Map<String, double> hrData = {
    '08:00': 120,
    '09:00': 100,
    '10:00': 80,
    '11:00': 90,
    '12:00': 100,
  };

  @override
  void onInit() async {
    historyList.value = await history.fetchHistory();
    hrCharting();
    super.onInit();
  }

  void hrCharting() async {
    for (var item in historyList) {
      logger.d(item);
      final time = DateTime.fromMicrosecondsSinceEpoch(item['endTime']);
      final r = await prov.fetchReport(item['_id']);
      report.add(r);
    }
    for (var item in report) {
      if (item['report']['reports'].isEmpty) {
        historyList.removeWhere((element) => element['_id'] == item['_id']);
      }
    }
    report.removeWhere((element) => element['report']['reports'].isEmpty);
    if (report.length > 5) {
      report.removeRange(5, report.length);
    }

    historyList.clear();
    // assign new value to hrData from report
    for (var item in report) {
      // logger.d(item);
    }
  }
}
