import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/modules/history/history_controller.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/polar_service.dart';

class WorkoutStartController extends GetxController {
  final workout = Get.arguments as ExerciseModel;

  final nowInstruction = 0.obs;
  final countDownTimer = CountDownController().obs;
  final isPause = false.obs;
  final isNowExerciseFinish = false.obs;
  final isAllExerciseFinish = false.obs;

  final PolarService _polarService = Get.find<PolarService>();
  final HistoryController _historyController = Get.find<HistoryController>();

  void nextInstruction(totalInstruction) {
    if (nowInstruction.value + 1 >= totalInstruction) {
      countDownTimer.value.reset();
      _polarService.isStartWorkout.value = false;
      isAllExerciseFinish.value = true;
      Get.offNamed(AppRoutes.dashboard);
      _historyController.fetchHistory();
    }
    if ((nowInstruction.value + 1) < totalInstruction) {
      countDownTimer.value.restart(
          duration: workout.instructions[nowInstruction.value].duration);
      isNowExerciseFinish.value = false;
      nowInstruction.value++;
    }
  }

  @override
  void onInit() {
    _polarService.isStartWorkout.value = true;
    _polarService.starWorkout(workout.id, workout.duration ,'EMPTY');
    super.onInit();
  }
}
