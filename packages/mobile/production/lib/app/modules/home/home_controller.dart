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

  final Map<String, double>? hrData = {};

  @override
  void onInit() async {
    hrCharting();
    super.onInit();
  }

  @override
  void onReady() {
    hrCharting();
    super.onReady();
  }

  void hrCharting() async {
    report.clear();
    historyList.value = await history.fetchHistory();
    logger.d(historyList.length);
    Map<String, double> dummy = {};
    for (var item in historyList) {
      final r = await prov.fetchReport(item['_id']);
      report.add(r);
    }
    historyList.clear();
    logger.d(report.length);
    if (report.length > 5) {
      report.removeRange(0, report.length - 5);
    }
    final dateFormat = DateFormat('HH:mm');
    for (var item in report) {
      final reportData = item['report'];
      final endTimeMicros = reportData['endTime'];
      final date = DateTime.fromMicrosecondsSinceEpoch(endTimeMicros);
      final formattedDate = dateFormat.format(date);
      final hrValue = reportData['reports'][0]['data'][0]['value'] as List;
      final avg = hrValue.map((entry) => entry[1]).reduce((a, b) => a + b) /
          hrValue.length;
      dummy[formattedDate] = avg;
    }

    hrData!.clear();
    hrData!.addAll(dummy);
    update();
  }
}
