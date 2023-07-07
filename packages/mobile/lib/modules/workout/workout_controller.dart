import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

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
      final response =
          await _getConnect.get('http://192.168.98.169:3000/api/exercise');
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = response.body['exercises'];
        todayGoalWorkouts = jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
        return jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
      } else {
        const GetSnackBar(title: 'Error', message: 'Failed to load exercises');
      }
    } catch (e) {
      GetSnackBar(title: 'Error', message: 'Failed to load exercises $e');
    }
  }

  goToWorkoutDetail(ExerciseModel exercise) {
    Get.toNamed(AppRoutes.workoutDetail, arguments: exercise);
  }
}
