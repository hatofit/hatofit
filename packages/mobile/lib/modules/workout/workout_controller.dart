import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WorkoutController extends GetxController {
  final String title = 'Workout';
  final _getConnect = GetConnect();
  List<ExerciseModel> todayGoalWorkouts = [];
  @override
  void onInit() {
    fetchExercises();
    super.onInit();
  }

  Future fetchExercises() async {
    try {
      final url = "${dotenv.env['API_BASE_URL'] ?? ''}/exercise";

      final response = await _getConnect.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.body['exercises'];
        todayGoalWorkouts = jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
        return jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
      } else {
        Get.snackbar('Error', 'Failed to load exercises');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  goToWorkoutDetail(ExerciseModel exercise) {
    Get.toNamed(AppRoutes.workoutDetail, arguments: exercise);
  }
}
