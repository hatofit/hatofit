import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/exercise_model.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final isExpanded = true.obs;
  late ScrollController scrollController;
  final textTitleOpacity = 1.0.obs;
  late TabController _tabController;
  late YoutubePlayerController _youtubePlayerController;
  late String videoURL;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      icon: Icon(CupertinoIcons.photo),
      text: 'Image',
    ),
    const Tab(
      icon: Icon(CupertinoIcons.film),
      text: 'Video',
    ),
  ];

  final workout = Get.arguments as ExerciseModel;

  @override
  void onInit() {
    scrollController = ScrollController();
    _youtubePlayerController = YoutubePlayerController(initialVideoId: '');
    _tabController = TabController(vsync: this, length: myTabs.length);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    _tabController.dispose();
    _youtubePlayerController.dispose();
    super.onClose();
  }

  void convertToMinutes() {
    final int duration = workout.duration;
    if (duration >= 60) {}
  }

  void showDetailsModal(BuildContext context, Instruction instruction) {
    if (instruction.content!.video != '') {
      videoURL = instruction.content!.video;
      _youtubePlayerController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL)!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: true,
        ),
      );
      Get.bottomSheet(
        isScrollControlled: true,
        SafeArea(
          child: Container(
              height: Get.height * 0.9,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  TabBar(
                    tabs: myTabs,
                    controller: _tabController,
                    indicatorColor: Theme.of(context).primaryColor,
                    labelColor: Theme.of(context).primaryColor,
                    unselectedLabelColor: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: TabBarView(controller: _tabController, children: [
                        if (instruction.content!.image.endsWith('json'))
                          Lottie.network(instruction.content!.image,
                              fit: BoxFit.fill)
                        else
                          CachedNetworkImage(
                            imageUrl: instruction.content!.image,
                            fit: BoxFit.fill,
                            placeholder: (context, url) => const Center(
                              child: CupertinoActivityIndicator(
                                radius: 16,
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(CupertinoIcons.wifi_exclamationmark),
                          ),
                        YoutubePlayer(
                          controller: _youtubePlayerController,
                          showVideoProgressIndicator: true,
                          onReady: () => _youtubePlayerController.play(),
                          onEnded: (metaData) =>
                              _youtubePlayerController.pause(),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: Get.height * 0.4,
                    child: Column(
                      children: [
                        Text(instruction.name!,
                            style: Theme.of(context).textTheme.displayMedium),
                        const SizedBox(height: 16),
                        Text(instruction.description!,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ],
              )),
        ),
        backgroundColor: Colors.transparent,
      );
    }
  }
}
