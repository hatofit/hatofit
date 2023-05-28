import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/pages/workout_detail/workout_details_page.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

class ChooseModeWidget extends StatefulWidget {
  const ChooseModeWidget({super.key});

  @override
  State<ChooseModeWidget> createState() => _ChooseModeWidgetState();
}

class _ChooseModeWidgetState extends State<ChooseModeWidget> {
  final icons = [
    FontAwesomeIcons.personRunning,
    FontAwesomeIcons.personWalking,
    FontAwesomeIcons.personBiking,
    FontAwesomeIcons.personSwimming,
    FontAwesomeIcons.personBooth,
    FontAwesomeIcons.personSkiing,
  ];
  final List<String> titles = [
    'Running',
    'Walking',
    'Biking',
    'Swimming',
    'Booth',
    'Skiing',
  ];

  DashboardController dashboardController = Get.find();
  int currentIndex = 0;

  void changeIcon(bool isNext) {
    setState(() {
      if (isNext) {
        if (currentIndex < icons.length - 1) {
          currentIndex++;
        }
      } else {
        if (currentIndex > 0) {
          currentIndex--;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: dashboardController.screenHeight * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconWrapper(
                        icon: currentIndex > 0
                            ? icons[currentIndex - 1]
                            : icons.last,
                        borderRadius: BorderRadius.circular(84.0),
                        containerSize: 90.0,
                        iconSize: 42.0,
                        backgroundColor: ColorPalette.crimsonRed20,
                        iconColor: ColorPalette.crimsonRed50,
                      ),
                      SizedBox(width: dashboardController.screenWidth * 0.2),
                      IconWrapper(
                        icon: currentIndex < icons.length - 1
                            ? icons[currentIndex + 1]
                            : icons.first,
                        borderRadius: BorderRadius.circular(84.0),
                        containerSize: 90.0,
                        iconSize: 42.0,
                        backgroundColor: ColorPalette.crimsonRed20,
                        iconColor: ColorPalette.crimsonRed50,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 32,
                        icon: const Icon(FontAwesomeIcons.chevronLeft),
                        onPressed: () {
                          changeIcon(false);
                        },
                      ),
                      IconWrapper(
                        icon: icons[currentIndex],
                        containerSize: 144.0,
                        iconSize: 84.0,
                        borderRadius: BorderRadius.circular(84.0),
                        backgroundColor: ColorPalette.crimsonRed,
                        iconColor: ColorPalette.black00,
                      ),
                      IconButton(
                        iconSize: 32,
                        icon: const Icon(FontAwesomeIcons.chevronRight),
                        onPressed: () {
                          changeIcon(true);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  CustomText(text: titles[currentIndex], fontSize: 24.0),
                ],
              ),
            ],
          ),
          SizedBox(height: dashboardController.screenHeight * 0.032),
          MaterialButton(
            //Navigate to workout detail page
            onPressed: () {
              Get.to(() => const WorkoutDetailPage());
            },
            color: ColorPalette.crimsonRed,
            textColor: ColorPalette.black00,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(64),
            ),
            minWidth: dashboardController.screenWidth * 0.8,
            height: 48.0,
            child: const Text('Start Workout'),
          ),
        ],
      ),
    );
  }
}
