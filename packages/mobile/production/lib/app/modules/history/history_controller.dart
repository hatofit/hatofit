import 'package:get/get.dart';
import 'package:hatofit/utils/time_utils.dart';

import '../../services/internet_service.dart';

class HistoryController extends GetxController {
  final String title = 'History';
  final RxList<dynamic> historyData = [].obs;

  String duration(int f, int e) {
    final duration = TimeUtils.elapsed(f, e);

    return duration;
  }

  @override
  void onInit() {
    fetchHistory();
    super.onInit();
  }

  Future<List<dynamic>> fetchHistory() async {
    final res = await InternetService().fetchHistory();
    final data = res.body['sessions'];

    historyData.value = data;
    update();
    return data;
  }

  String dateConverter(String datetime) {
    final date = DateTime.parse(datetime);
    final numToMonth = {
      1: 'Jan',
      2: 'Feb',
      3: 'Mar',
      4: 'Apr',
      5: 'May',
      6: 'Jun',
      7: 'July',
      8: 'Aug',
      9: 'Sep',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };

    final formattedDate = "${date.day} ${numToMonth[date.month]} ${date.year}";
    return formattedDate;
  }
}
