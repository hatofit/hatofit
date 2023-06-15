import 'package:get/get.dart';
import 'package:polar_hr_devices/services/streaming_service.dart';

class HomeController extends GetxController { 
  final DateTime title = DateTime.now();
  final StreamingService streamingService = StreamingService();
}
