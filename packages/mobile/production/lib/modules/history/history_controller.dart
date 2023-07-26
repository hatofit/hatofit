
import 'package:get/get.dart';
import 'package:polar_hr_devices/services/internet_service.dart';

class HistoryController extends GetxController {
  final String title = 'History';
  Future<void> refreshData() async {
    await InternetService().fetchHistory();
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
