import 'package:get/get.dart';
import 'package:polar_hr_devices/services/streaming_service.dart';

class WorkoutController extends GetxController {
  final StreamingService streamingService = StreamingService();
  final String title = 'Workout Title';
}

class ProgressData {
  ProgressData(this.noList, this.length,);
  final double noList;
  final double length; 
}
