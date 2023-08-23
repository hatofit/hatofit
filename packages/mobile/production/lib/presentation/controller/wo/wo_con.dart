import 'dart:async';
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
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/types/free_workout_type.dart';
import 'package:hatofit/data/models/exercise.dart';
import 'package:hatofit/data/models/session.dart';
import 'package:hatofit/domain/usecases/api/sesion/save_session_api_uc.dart';
import 'package:lottie/lottie.dart';
import 'package:vibration/vibration.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WoCon extends GetxController with GetSingleTickerProviderStateMixin {
  final SaveSessionApiUc _saveSessionApiUc;
  WoCon(this._saveSessionApiUc);
  final store = Get.find<LocalStorageService>();
  List<SessionDataItem> sessionData = [];

  ///
  /// General
  ///
  final isWOStart = false.obs;

  @override
  void onInit() {
    hrList.clear();
    hrStats.value = null;
    _youtubePlayerController = YoutubePlayerController(initialVideoId: '');
    _tabController = TabController(vsync: this, length: myTabs.length);
    // _polarService.isStartWorkout.value = true;
    // _polarService.starWorkout(workout.id, workout.duration, 'EMPTY');
    super.onInit();
  }

  @override
  void onClose() {
    hrList.clear();
    hrStats.value = null;
    _tabController.dispose();
    _youtubePlayerController.dispose();
    super.onClose();
  }

  void saveSession(String? id) {
    final session = Session(
      exerciseId: null,
      startTime: hrList.first['time'],
      endTime: hrList.last['time'],
      timelines: [],
      data: sessionData,
    );
    if (id != null) {
      session.exerciseId = id;
    }
    postSession(session);
  }

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

  String currentZone = '';

  hrZone(int hr) {
    final userDateOfBirth = store.user!.dateOfBirth;
    final age = DateTime.now().year - userDateOfBirth!.year;
    final maxHR = 220 - age;
    String newZone = '';

    if (hr < (maxHR * 0.5)) {
      newZone = 'Very light';
    } else if (hr < (maxHR * 0.6)) {
      newZone = 'Light';
    } else if (hr < (maxHR * 0.7)) {
      newZone = 'Moderate';
    } else if (hr < (maxHR * 0.8)) {
      newZone = 'Hard';
    } else {
      newZone = 'Maximum';
    }

    if (currentZone != newZone) {
      currentZone = newZone;
      handleSnackBar(newZone);
    }
  }

  void handleSnackBar(String zone) {
    Future.delayed(const Duration(milliseconds: 500), () {
      Get.snackbar(
        'Zone',
        zone,
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      );
      Vibration.vibrate(duration: 1000, amplitude: 128);
    });
  }

  ///
  /// Free Workout
  ///
  final List<Map<String, dynamic>> hrList = [];

  void add(int time, int hr) {
    hrList.add({'time': time, 'hr': hr});
  }

  final hrStats = Rx<HrStats?>(null);
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

  Future savePrompt(BuildContext context) {
    return Get.defaultDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: 'Select Workout Type',
      titlePadding: const EdgeInsets.all(16),
      titleStyle: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge!.color,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      content: SizedBox(
        height: ThemeManager().screenHeight * 0.75,
        width: ThemeManager().screenWidth * 0.75,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Select Last Workout Type you did',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              const Divider(thickness: 1),
              Column(
                children: FreeWorkoutType.values.map((type) {
                  return InkWell(
                    onTap: () {
                      saveSession(type.title.toLowerCase());
                      Get.offNamed(AppRoutes.dashboard);
                      onClose();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Transform.scale(
                                scale: 1.5,
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                    Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    BlendMode.srcATop,
                                  ),
                                  child: type.gifImage,
                                )),
                          ),
                          Text(type.title,
                              style: Theme.of(context).textTheme.bodyLarge),
                          Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? ColorConstants.darkContainer
                                    : ColorConstants.lightContainer,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  saveSession(type.title.toLowerCase());
                                  Get.offNamed(AppRoutes.dashboard);
                                  onClose();
                                },
                                icon: const Icon(CupertinoIcons.right_chevron),
                              ))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
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
  void nextInstruction(int totalInstruction, Exercise exercise) {
    if (nowInstruction.value + 1 >= totalInstruction) {
      countDownTimer.value.reset();
      isNowExerciseFinish.value = true;
      saveSession(exercise.id);
      Get.offNamed(AppRoutes.dashboard);
    }
    if ((nowInstruction.value + 1) < totalInstruction) {
      countDownTimer.value.restart(
          duration: exercise.instructions[nowInstruction.value].duration);
      isNowExerciseFinish.value = false;
      nowInstruction.value++;
    }
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

  final min = hrList
      .reduce((curr, next) => curr['hr'] < next['hr'] ? curr : next)['hr'];
  final max = hrList
      .reduce((curr, next) => curr['hr'] > next['hr'] ? curr : next)['hr'];
  final avg = hrList.map((e) => e['hr']).reduce((curr, next) => curr + next) ~/
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
}
