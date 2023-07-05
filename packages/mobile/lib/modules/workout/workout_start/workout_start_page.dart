import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:polar_hr_devices/models/exercise_model.dart';
import 'package:polar_hr_devices/modules/workout/workout_start/workout_start_controller.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';

class WorkoutStartPage extends GetView<WorkoutStartController> {
  final ExerciseModel workout;
  const WorkoutStartPage(this.workout, {super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => Column(
            children: [
          Lottie.network(workout
              .instructions[controller.nowInstruction.value]
              .content!
              .image),
          CustomText(
              text: workout
                  .instructions[controller.nowInstruction.value].duration
                  .toString(),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          CustomText(
            text: controller.countDownTimer.value.toString(),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          TextButton(
            onPressed: () {
              controller.nextInstruction(workout.instructions.length - 1);
            },
            child: const CustomText(
              text: 'Next',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}



// class WorkoutStartPage extends StatefulWidget {
//   final ExerciseModel workout;
//   const WorkoutStartPage({super.key, required this.workout});

//   @override
//   State<WorkoutStartPage> createState() => _WorkoutStartPageState();
// }

// class _WorkoutStartPageState extends State<WorkoutStartPage> {
//   DashboardController dashboardController = Get.put(DashboardController());
//   late YoutubePlayerController _youtubePlayerController;
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
//     SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
//     _youtubePlayerController = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(
//           widget.workout.instructions[0].content!.video)!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     _youtubePlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(Icons.arrow_back_ios),
//           ),
//           title: Text(
//             widget.workout.name,
//           ),
//           centerTitle: true,
//         ),
//         body: Stack(
//           children: [
//             YoutubePlayer(
//               onReady: () {
//                 print('YT ready');
//                 _youtubePlayerController.play();
//               },
//               onEnded: (YoutubeMetaData metaData) {
//                 print('YT ended');
//                 _youtubePlayerController.pause();
//               },
//               controller: _youtubePlayerController,
//               showVideoProgressIndicator: true,
//             ),
//             Obx(
//               () => Positioned(
//                 top: 0,
//                 right: 0,
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   color: Colors.black.withOpacity(0.5),
//                   alignment: Alignment.center,
//                   child: Text(
//                     dashboardController.hrValue.toString(),
//                     style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
