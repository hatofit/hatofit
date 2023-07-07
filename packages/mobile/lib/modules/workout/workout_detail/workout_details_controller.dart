import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutDetailsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final isExpanded = true.obs;
  late ScrollController scrollController;
  final textTitleOpacity = 1.0.obs;
  late TabController _tabController;
  late YoutubePlayerController _youtubePlayerController;
  late String videoURL;
  final List<Tab> myTabs = const <Tab>[
    Tab(text: 'Animation'),
    Tab(text: 'Video'),
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

  void showDetailsModal(Instruction instruction) {
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
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: TabBarView(
              controller: _tabController,
              children: myTabs.map((Tab tab) {
                return Center(
                  child: tab.text == 'Animation'
                      ? Column(
                          children: [
                            const SizedBox(height: 10),
                            CustomText(text: tab.text!),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * 0.9,
                              height: Get.width * 0.9,
                              child: Lottie.network(
                                instruction.content!.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            CustomText(text: instruction.name!)
                          ],
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 10),
                            CustomText(text: tab.text!),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              width: 100,
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            YoutubePlayer(
                              controller: _youtubePlayerController,
                              showVideoProgressIndicator: true,
                              onReady: () => _youtubePlayerController.play(),
                              onEnded: (metaData) =>
                                  _youtubePlayerController.pause(),
                            ),
                          ],
                        ),
                );
              }).toList(),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
      );
    }
  }
}
