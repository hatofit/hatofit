import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/modules/workout/workout_controller.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class WorkoutPage extends GetView<WorkoutController> {
  const WorkoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      appBar: CustomAppBar(
        title: controller.title,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Today\'s Goal Workouts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.todayGoalWorkouts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      controller.goToWorkoutDetail(
                          controller.todayGoalWorkouts[index]);
                    },
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.9),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              controller.todayGoalWorkouts[index].image,
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.4),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.todayGoalWorkouts[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            const Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.dumbbell,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomText(
                                  text: '10 exercises',
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            const Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.stopwatch,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                CustomText(
                                  text: '10 min',
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
            child: Text(
              'Top Collection Workouts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.topCollectionWorkouts.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                    child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.9),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(controller
                                  .topCollectionWorkouts[index].image),
                              fit: BoxFit.cover,
                              opacity: 0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: controller
                                    .topCollectionWorkouts[index].name,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.dumbbell,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    text: '12 Exercises',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.clock,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  CustomText(
                                    text: '21 min',
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
