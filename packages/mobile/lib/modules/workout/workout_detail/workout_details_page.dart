import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/modules/workout/workout_controller.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class WorkoutDetailsPage extends GetView<WorkoutController> {
  final ExerciseModel workout;

  const WorkoutDetailsPage(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(workout.thumbnail),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(32),
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: workout.name,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: ColorPalette.black00,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: CustomText(
                                text: workout.type,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.stopwatch,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                CustomText(
                                  text: "workout.duration",
                                  fontSize: 14,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.fitness_center,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                CustomText(
                                  text: "workout.excerciseCount.toString()",
                                  fontSize: 14,
                                ),
                                const CustomText(
                                  text: ' Exercises',
                                  fontSize: 14,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(workout.thumbnail),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          controller.startWorkout(workout);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: ColorPalette.crimsonRed,
                          fixedSize: const Size(400, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),
                          child: CustomText(
                            text: 'Start Workout',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
