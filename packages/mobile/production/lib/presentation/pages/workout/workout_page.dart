import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/app.dart';
import 'package:hatofit/presentation/controller/page/page_con.dart';

import '../../widget/appBar/custom_app_bar.dart';

class WorkoutPage extends GetView<PageCon> {
  const WorkoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Workout',
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.fetchExercises(),
        child: FutureBuilder(
          future: controller.fetchExercises(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var exercises =
                  snapshot.data!.any((element) => element.thumbnail == '')
                      ? snapshot.data!
                          .where((element) => element.thumbnail != '')
                          .toList()
                      : snapshot.data!;
              logger.i(exercises.map((e) => e.name));
              return SizedBox(
                child: ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.goToWorkoutDetail(exercises[index]);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                exercises[index].thumbnail,
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
                                exercises[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.dumbbell,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '${(exercises[index].instructions.length + 1) ~/ 2} sets',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.clock,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    '${exercises[index].duration} sec',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                  child: CupertinoActivityIndicator(
                radius: 16.0,
              ));
            }
          },
        ),
      ),
    );
  }
}
