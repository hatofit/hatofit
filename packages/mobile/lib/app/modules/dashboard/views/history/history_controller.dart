import 'package:get/get.dart';
import 'package:hatofit/utils/time_utils.dart';
import 'package:intl/intl.dart';

import '../../../../services/internet_service.dart';

class HistoryController extends GetxController {
  final String title = 'History';
  final RxList<dynamic> historyData = [].obs;

  String duration(int f, int e) {
    final duration = TimeUtils.elapsed(f, e);
    return duration;
  }

  @override
  void onReady() {
    fetchHistory();
    super.onReady();
  }

  Future<List<dynamic>> fetchHistory() async {
    final res = await InternetService().fetchHistory();
    if (res.body != null && res.body['sessions'] != null) {
      historyData.value = res.body['sessions'];
      update();
    }
    return historyData;
  }

  String dateToString(int time) {
    final date = DateTime.fromMicrosecondsSinceEpoch(time);
    final formatter = DateFormat('d MMMM yyyy');
    final formattedDate = formatter.format(date);
    return formattedDate;
  }
}
