import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/models/workout_model.dart';
import 'package:polar_hr_devices/modules/dashboard/dashboard_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutStart extends StatefulWidget {
  final WorkoutModel workout;
  const WorkoutStart({super.key, required this.workout});

  @override
  State<WorkoutStart> createState() => _WorkoutStartState();
}

class _WorkoutStartState extends State<WorkoutStart> {
  DashboardController dashboardController = Get.put(DashboardController());
  late YoutubePlayerController _youtubePlayerController;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.workout.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    //reset status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            widget.workout.name,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            YoutubePlayer(
              controller: _youtubePlayerController,
              showVideoProgressIndicator: true,
            ),
            Obx(
              () => Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.black.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Text(
                    dashboardController.hrValue.toString(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map<String, dynamic> jsonRequest = {
  "exerciseId": "64905689c17f39d5002c2d94",
  "startTime": 1686913335015,
  "endTime": 1686913341097,
  "timelines": [
    {"name": "instruction_1", "startTime": 1686913335015},
    {"name": "rest_1", "startTime": 1686913341097}
  ],
  "data": [
    {
      "second": 0,
      "timeStamp": 1686913335064,
      "devices": [
        {
          "type": "PolarDataType.hr",
          "identifier": "BBADFE28",
          "value": [
            {
              "hr": 92,
              "rrsMs": [648]
            }
          ]
        },
        {
          "type": "PolarDataType.ecg",
          "identifier": "BBADFE28",
          "value": [
            {
              "hr": 92,
              "rrsMs": [648]
            }
          ]
        }
      ]
    },
  ]
};

//   SessionData sessionData = SessionData.fromJson(jsonRequest);
//   print(sessionData.toJson());