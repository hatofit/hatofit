import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/modules/workout/workout_detail/workout_details_controller.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';

class WorkoutDetailsPage extends GetView<WorkoutDetailsController> {
  final ExerciseModel workout;

  const WorkoutDetailsPage(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < workout.instructions.length; i++) {
      if (workout.instructions[i].type == 'rest') {
        workout.instructions.removeAt(i);
      }
      if (i == workout.instructions.length) {}
    }
    controller.scrollController.addListener(() {
      if (controller.scrollController.offset > 170) {
        controller.isExpanded.value = false;
      } else {
        controller.textTitleOpacity.value =
            1.0 - (controller.scrollController.offset / 200);
        controller.isExpanded.value = true;
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              Obx(
                () => SliverAppBar(
                  elevation: 0,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  pinned: true,
                  expandedHeight: 275,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: controller.isExpanded.value
                        ? Colors.white
                        : Colors.black,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  title: controller.isExpanded.value
                      ? Text(
                          '',
                          style: Theme.of(context).textTheme.displaySmall,
                        )
                      : Text(
                          workout.name,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                  flexibleSpace: FlexibleSpaceBar(
                    title: controller.isExpanded.value
                        ? Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16.0,
                              bottom: 16.0,
                            ),
                            child: Opacity(
                              opacity: controller.textTitleOpacity.value,
                              child: Text(
                                workout.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: controller.isExpanded.value
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                    background: CachedNetworkImage(
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black.withOpacity(0.5),
                      imageUrl: workout.thumbnail,
                      fit: BoxFit.cover,
                    ),
                    stretchModes: const [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle,
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Container(
                      height: 32.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                      ),
                      child: Container(
                        width: 40.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: ColorPalette.black25,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text('${workout.duration} s',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(width: 8),
                        Text('${workout.instructions.length} steps',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    )),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        controller
                            .showDetailsModal(workout.instructions[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: const Border(
                              top: BorderSide(
                                color: ColorPalette.black25,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              if (workout.instructions[index].content!.image
                                  .endsWith('json'))
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: FutureBuilder(
                                        future: Future.delayed(
                                            const Duration(seconds: 1)),
                                        builder: (context, snapshot) => snapshot
                                                    .connectionState ==
                                                ConnectionState.done
                                            ? Lottie.network(
                                                workout.instructions[index]
                                                    .content!.image,
                                                width: 100,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              )
                                            : const Center(
                                                child:
                                                    CircularProgressIndicator())),
                                  ),
                                )
                              else
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    width: 100,
                                    height: 100,
                                    imageUrl: workout
                                        .instructions[index].content!.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      workout.instructions[index].name
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Text(
                                      '${workout.instructions[index].duration.toString()} s',
                                    style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: workout.instructions.length,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 80,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              child: FloatingActionButton.extended(
                extendedPadding: const EdgeInsets.symmetric(horizontal: 32.0),
                onPressed: () {
                  Get.toNamed(AppRoutes.workoutStart, arguments: workout);
                },
                label: const Text('Start'),
                icon: const Icon(Icons.play_arrow),
                backgroundColor: ColorPalette.crimsonRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
