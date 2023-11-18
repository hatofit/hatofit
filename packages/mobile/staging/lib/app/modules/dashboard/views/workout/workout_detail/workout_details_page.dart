import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:hatofit/app/modules/dashboard/views/workout/workout_detail/workout_details_controller.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:lottie/lottie.dart';

class WorkoutDetailsPage extends GetView<WorkoutDetailsController> {
  final ExerciseModel workout;

  const WorkoutDetailsPage(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Instruction> instructions = [];

    for (var i = 0; i < workout.instructions.length; i++) {
      if (workout.instructions[i].type == 'instruction') {
        instructions.add(workout.instructions[i]);
      }
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
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(CupertinoIcons.stopwatch,
                                color: Theme.of(context).primaryColorDark,
                                size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${workout.duration} s',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            Icon(CupertinoIcons.list_bullet,
                                color: Theme.of(context).primaryColorDark,
                                size: 16),
                            const SizedBox(width: 4),
                            Text(
                              '${workout.instructions.length} steps',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        controller.showDetailsModal(
                            context, instructions[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 8, bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            border: const Border(
                              top: BorderSide(
                                color: Colors.black26,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              if (instructions[index]
                                  .content!
                                  .image
                                  .endsWith('json'))
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, left: 16, right: 16),
                                  child: SizedBox(
                                      width: 100,
                                      height: 100,
                                      child: FutureBuilder(
                                        future: Future.delayed(
                                            const Duration(seconds: 1)),
                                        builder: (context, snapshot) => snapshot
                                                    .connectionState ==
                                                ConnectionState.done
                                            ? Container(
                                                width: 100,
                                                height: 100,
                                                color: Colors.white,
                                                child: Lottie.network(
                                                  instructions[index]
                                                      .content!
                                                      .image,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : const Center(
                                                child:
                                                    CupertinoActivityIndicator(
                                                radius: 16.0,
                                              )),
                                      )),
                                )
                              else
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    width: 100,
                                    height: 100,
                                    imageUrl:
                                        instructions[index].content!.image,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => const Center(
                                      child: CupertinoActivityIndicator(
                                        radius: 16,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(CupertinoIcons
                                            .wifi_exclamationmark),
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
                                      instructions[index].name.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Row(
                                      children: [
                                        Icon(CupertinoIcons.stopwatch,
                                            color: Theme.of(context)
                                                .primaryColorDark,
                                            size: 16),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${instructions[index].duration.toString()} s',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ],
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
                  childCount: instructions.length,
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
                backgroundColor: ColorConstants.crimsonRed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
