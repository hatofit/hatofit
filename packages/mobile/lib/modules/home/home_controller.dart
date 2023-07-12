import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:polar_hr_devices/main.dart';

class HomeController extends GetxController {
  final String title = 'Hi, ${storage.read('name')} 👋';
  final String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());
}
