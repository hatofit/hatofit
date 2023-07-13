import 'package:get/get.dart';

class HistoryController extends GetxController {
  final String title = 'History';

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
