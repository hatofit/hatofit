import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  final String title = 'Hi, Pengguna 👋';
  final String formattedDate = DateFormat('d MMMM yyyy').format(DateTime.now());
}
