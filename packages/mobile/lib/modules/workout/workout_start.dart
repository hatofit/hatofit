import 'package:flutter/cupertino.dart';
import 'package:polar_hr_devices/models/workout_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutStart extends StatefulWidget {
  final WorkoutModel workout;
  const WorkoutStart({super.key, required this.workout});

  @override
  State<WorkoutStart> createState() => _WorkoutStartState();
}

class _WorkoutStartState extends State<WorkoutStart> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
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
    _youtubePlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.workout.name),
      ),
      child: SafeArea(
        child: YoutubePlayer(
          controller: _youtubePlayerController,
          showVideoProgressIndicator: true,
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