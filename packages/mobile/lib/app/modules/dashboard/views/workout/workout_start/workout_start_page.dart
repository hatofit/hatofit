import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_detail/workout_details_controller.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_start/workout_start_controller.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:lottie/lottie.dart';

class WorkoutStartPage extends GetView<WorkoutStartController> {
  final ExerciseModel workout;
  const WorkoutStartPage(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    final WorkoutDetailsController workoutDetailsController =
        Get.find<WorkoutDetailsController>();
    final BluetoothService bleService = Get.find<BluetoothService>();
    return Obx(() {
      controller.userZone(bleService.detectedDevices.first.hr.value);
      return Scaffold(
        appBar: AppBar(
            title: workout.instructions[controller.nowInstruction.value].type ==
                    'rest'
                ? Text('Rest', style: Theme.of(context).textTheme.displayMedium)
                : Text(
                    workout.instructions[controller.nowInstruction.value].name
                        .toString(),
                    style: Theme.of(context).textTheme.displayMedium),
            centerTitle: true,
            actions: [
              workout.instructions[controller.nowInstruction.value].type ==
                      'rest'
                  ? Container()
                  : IconButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(right: 16))),
                      onPressed: () {
                        workoutDetailsController.showDetailsModal(
                            context,
                            workout
                                .instructions[controller.nowInstruction.value]);
                      },
                      icon: const Icon(CupertinoIcons.film))
            ]),
        body: Stack(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: bleService.isConnectedDevice.value
                    ? Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ThemeManager().isDarkMode
                              ? ColorConstants.darkContainer
                              : ColorConstants.lightContainer,
                        ),
                        margin: const EdgeInsets.only(top: 100, left: 24),
                        padding: const EdgeInsets.all(8),
                        child: Column(children: [
                          Row(
                            children: [
                              const Icon(CupertinoIcons.heart_fill,
                                  color: ColorConstants.crimsonRed),
                              const SizedBox(width: 8),
                              Text(
                                  bleService.detectedDevices.first.hr.value == 0
                                      ? '--'
                                      : '${bleService.detectedDevices.first.hr.value}',
                                  style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))
                            ],
                          )
                        ]),
                      )
                    : Container()),
            Center(
              child: Column(
                children: [
                  workout.instructions[controller.nowInstruction.value].type ==
                          'rest'
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: ThemeManager().isDarkMode
                                ? ColorConstants.darkContainer
                                : ColorConstants.lightContainer,
                          ),
                          height: 350,
                          width: 350,
                          padding: const EdgeInsets.only(
                            left: 32,
                          ),
                          child: Center(
                            child: Lottie.asset('assets/animations/rest.json',
                                fit: BoxFit.cover),
                          ))
                      : SizedBox(
                          child: Column(children: [
                            if (workout
                                .instructions[controller.nowInstruction.value]
                                .content!
                                .image
                                .endsWith('json'))
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ThemeManager().isDarkMode
                                      ? ColorConstants.darkContainer
                                      : ColorConstants.lightContainer,
                                ),
                                height: 350,
                                width: 350,
                                padding: const EdgeInsets.all(16),
                                child: Center(
                                  child: Lottie.network(
                                    workout
                                        .instructions[
                                            controller.nowInstruction.value]
                                        .content!
                                        .image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: CachedNetworkImage(
                                  height: 350,
                                  width: 350,
                                  imageUrl: workout
                                      .instructions[
                                          controller.nowInstruction.value]
                                      .content!
                                      .image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                          ]),
                        ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          workout.instructions[controller.nowInstruction.value]
                                      .type ==
                                  'rest'
                              ? Text(
                                  'Next : ${workout.instructions[controller.nowInstruction.value + 1].name.toString()}',
                                  style:
                                      Theme.of(context).textTheme.displayMedium)
                              : Container(),
                          const SizedBox(
                            height: 16,
                          ),
                          CircularCountDownTimer(
                            width: 150,
                            height: 150,
                            duration: workout
                                    .instructions[
                                        controller.nowInstruction.value]
                                    .duration +
                                1,
                            ringColor: ThemeManager().isDarkMode
                                ? ColorConstants.darkContainer
                                : ColorConstants.lightContainer,
                            fillColor: Theme.of(context).primaryColor,
                            controller: controller.countDownTimer.value,
                            strokeWidth: 16,
                            strokeCap: StrokeCap.round,
                            textStyle: Theme.of(context).textTheme.displayLarge,
                            isReverse: true,
                            onComplete: () {
                              controller.isNowExerciseFinish.toggle();
                            },
                            onChange: (value) {
                              // if (value == '0') {
                              //   controller.isNowExerciseFinish.value = true;
                              // } else {
                              //   controller.isNowExerciseFinish.value = false;
                              // }
                            },
                            onStart: () {
                              // controller.isPause.value = false;
                              // controller.isNowExerciseFinish.value = false;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                              width: Get.width * 0.5,
                              child: controller.isNowExerciseFinish.value
                                  ? ElevatedButton(
                                      onPressed: () {
                                        controller.nextInstruction(
                                            workout.instructions.length);
                                      },
                                      child: Text(
                                        controller.isNowExerciseFinish.value
                                            ? 'Next'
                                            : 'Finish',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    )
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (controller.isPause.value == true) {
                                          controller.countDownTimer.value
                                              .resume();
                                          controller.isPause.value = false;
                                        } else {
                                          controller.countDownTimer.value
                                              .pause();
                                          controller.isPause.value = true;
                                        }
                                      },
                                      child: Text(
                                        controller.isPause.value == false
                                            ? 'Pause'
                                            : 'Resume',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ),
                                    )),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
