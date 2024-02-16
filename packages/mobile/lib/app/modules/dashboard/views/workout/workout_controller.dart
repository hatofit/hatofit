import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/internet_service.dart';

class WorkoutController extends GetxController {
  final listExercise = <ExerciseModel>[].obs;
  final prov = Get.find<InternetService>();

  @override
  void onInit() {
    fetchExercises();
    super.onInit();
  }

  goToWorkoutDetail(ExerciseModel exercise) {
    Get.toNamed(AppRoutes.workoutDetail, arguments: exercise);
  }

  Future<List<ExerciseModel>> fetchExercises() async {
    final list = await prov.fetchExercises(showFromCompany: true);
    listExercise.value = list!;
    // listExercise.removeWhere((element) => element.type == '');
    print(listExercise);
    update();
    return list;
  }
}
