import 'dart:isolate';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dartz/dartz.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/app/services/polar_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/data/models/exercise.dart';
import 'package:hatofit/data/models/session.dart';
import 'package:hatofit/domain/usecases/api/sesion/save_session_api_uc.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WoCon extends GetxController     with GetSingleTickerProviderStateMixin {
  final SaveSessionApiUc _saveSessionApiUc;
  WoCon(this._saveSessionApiUc);
  final store = Get.find<LocalStorageService>();

  ///
  /// General
  ///
  final isWOStart = false.obs;
  final PolarService _pCon = Get.find<PolarService>();

  Future<void> postSession(Session session) async {
    try {
      final token = store.token;
      final res = await _saveSessionApiUc.execute(Tuple2(session, token!));
      res.fold((failure) {
        Get.snackbar(failure.message, failure.details);
      }, (success) {
        Get.snackbar('Success', 'Session saved');
      });
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  String findElapsed(int first, int last) {
    final DateTime startTime = DateTime.fromMicrosecondsSinceEpoch(first);
    final DateTime endTime = DateTime.fromMicrosecondsSinceEpoch(last);
    final Duration elapsed = endTime.difference(startTime);
    return elapsed.toString().split('.')[0];
  }

  ///
  /// Free Workout
  ///
  Session? session;

  final List<Map<String, dynamic>> hrList = [];
  void add(int time, int hr) {
    hrList.add({'time': time, 'hr': hr});
  }

  void getData() {
    session = _pCon.sessMod.value;
  }

  final hrStats = HrStats(avg: 0, max: 0, min: 0, last: 0, flSpot: []).obs;
  Future<void> calcHr() async {
    final ReceivePort rp = ReceivePort();
    final Isolate i = await Isolate.spawn(hrCalc, (rp.sendPort, hrList));
    rp.listen(
      (mes) {
        hrStats.value = mes;
        i.kill(priority: Isolate.immediate);
        rp.close();
      },
      cancelOnError: true,
      onDone: () {
        i.kill(priority: Isolate.immediate);
        rp.close();
      },
    );
  }

  ///
  /// Workout Detail
  ///
  final isExpanded = true.obs;
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

  final workout = Get.arguments as Exercise;
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
                    height: ThemeManager().screenHeight * 0.4,
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

  ///
  /// Workout Start
  ///

  final nowInstruction = 0.obs;
  final countDownTimer = CountDownController().obs;
  final isPause = false.obs;
  final isNowExerciseFinish = false.obs;
  final isAllExerciseFinish = false.obs;

  final PolarService _polarService = Get.find<PolarService>();

  void nextInstruction(totalInstruction) {
    if (nowInstruction.value + 1 >= totalInstruction) {
      countDownTimer.value.reset();
      _polarService.isStartWorkout.value = false;
      isAllExerciseFinish.value = true;
      Get.offNamed(AppRoutes.dashboard);
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
    _youtubePlayerController = YoutubePlayerController(initialVideoId: '');
    _tabController = TabController(vsync: this, length: myTabs.length);
    _polarService.isStartWorkout.value = true;
    _polarService.starWorkout(workout.id, workout.duration, 'EMPTY');
    super.onInit();
  }

  @override
  void onClose() {
    // scrollController.dispose();
    _tabController.dispose();
    _youtubePlayerController.dispose();
    super.onClose();
  }
}

class HrStats {
  final int avg;
  final int max;
  final int min;
  final int last;
  final List<FlSpot> flSpot;

  HrStats({
    required this.avg,
    required this.max,
    required this.min,
    required this.last,
    required this.flSpot,
  });
}

void hrCalc((SendPort, List<Map<String, dynamic>>) args) {
  final SendPort sendPort = args.$1;
  final List<Map<String, dynamic>> hrList = args.$2;

  if (hrList.length > 2) {
    final min = hrList
        .reduce((curr, next) => curr['hr'] < next['hr'] ? curr : next)['hr'];
    final max = hrList
        .reduce((curr, next) => curr['hr'] > next['hr'] ? curr : next)['hr'];
    final avg =
        hrList.map((e) => e['hr']).reduce((curr, next) => curr + next) ~/
            hrList.length;
    final last = hrList.last['hr'];
    final List<FlSpot> flSpot = hrList
        .map((e) => FlSpot(e['time'].toDouble(), e['hr'].toDouble()))
        .toList();
    sendPort.send(HrStats(
      avg: avg,
      max: max,
      min: min,
      last: last,
      flSpot: flSpot,
    ));
  } else {
    sendPort.send(HrStats(
      avg: 0,
      max: 0,
      min: 0,
      last: 0,
      flSpot: [],
    ));
  }
}
