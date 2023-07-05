import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Workout {
  final String name;
  final String date;

  Workout({
    required this.name,
    required this.date,
  });
}

class HistoryController extends GetxController {
  final _connectGetX = GetConnect();
  final String title = 'History';
  final RxList<Workout> workouts = <Workout>[].obs;
  late DateFormat formatter;
  DateTime now = DateTime.now();
  Response<dynamic> response = const Response<dynamic>();

  // Future<void> _sendGetRequest() async {
  //   response =
  //       await _connectGetX.get('https://polar.viandwi24.site/api/exercise');
  //   isToday();
  //   parseData();
  // }

  // void isToday() {
  //   DateTime date = DateTime.parse(response.body['exercises'][0]['createdAt']);
  //   if (now.year == date.year &&
  //       now.month == date.month &&
  //       now.day == date.day) {
  //     formatter = DateFormat('HH:mm:ss');
  //   } else {
  //     formatter = DateFormat('yyyy-MM-dd ');
  //   }
  // }

  void parseData() {
    int length = response.body['exercises'].length;
    for (int i = 0; i < length; i++) {
      DateTime dateTime =
          DateTime.parse(response.body['exercises'][i]['createdAt']);
      String formattedDate = formatter.format(dateTime);
      workouts.add(
        Workout(
          name: response.body['exercises'][i]['name'],
          date: formattedDate,
        ),
      );
    }
  }


  @override
  void onClose() {
    _connectGetX.dispose();
    super.onClose();
  }
}
