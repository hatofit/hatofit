import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_controller.dart';
import 'package:hatofit/app/widget/appBar/custom_app_bar.dart';

class WorkoutPage extends GetView<WorkoutController> {
  const WorkoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Workout',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 16,
        ),
        child: RefreshIndicator(
          onRefresh: () => controller.fetchExercises(),
          child: GetBuilder(
              init: controller,
              builder: (_) {
                return GridView.builder(
                  itemCount: controller.listExercise.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          controller.goToWorkoutDetail(
                              controller.listExercise[index]);
                        },
                        child: Card(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: AspectRatio(
                                  aspectRatio: 2 / 1.1,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: controller
                                        .listExercise[index].thumbnail,
                                    colorBlendMode: BlendMode.darken,
                                    color: Get.isDarkMode
                                        ? Colors.black.withOpacity(0.5)
                                        : Colors.black.withOpacity(0.25),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.listExercise[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.fitness_center,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '${controller.listExercise[index].instructions.length} sets',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.timer,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          '${controller.listExercise[index].duration} sec',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                );
              }),
        ),
      ),
    );
  }
}
