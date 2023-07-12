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

  final String title = 'History';

}
