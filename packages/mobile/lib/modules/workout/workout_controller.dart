import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/modules/workout/workout_detail/workout_details_page.dart';
import 'package:polar_hr_devices/modules/workout/workout_start/workout_start.dart';

class WorkoutController extends GetxController {
  final String title = 'Workout';
  final _getConnect = GetConnect();
  List<ExerciseModel>? todayGoalWorkouts;
  @override
  void onInit() {
    fetchExercises();
    super.onInit();
  }

  Future fetchExercises() async {
    try {
      final response =
          await _getConnect.get('http://192.168.245.169:3000/api/exercise');
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        final List<dynamic> jsonResponse = response.body['exercises'];

        return jsonResponse.map<ExerciseModel>((json) {
          return ExerciseModel.fromJson(json);
        }).toList();
      } else {
        throw Exception('Failed to load exercises');
      }
    } catch (e) {
      print('Error fetching exercises: $e');
    }
  }

  goToWorkoutDetail(ExerciseModel exercise) {
    Get.to(() => WorkoutDetailsPage(exercise));
  }

  startWorkout(ExerciseModel exercise) {
    Get.to(() => WorkoutStart(
          workout: exercise,
        ));
  }
}
