import 'package:get/get.dart';

class WorkoutController extends GetxController {
  final String title = 'Workout Title';
}

class ProgressData {
  ProgressData(
    this.noList,
    this.length,
  );
  final double noList;
  final double length;
}
