import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/pages/home/home_controller.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/widget/home/hr_lines_chart.dart';
import 'package:polar_hr_devices/widget/home/bmi_chart_widget.dart';
import 'package:polar_hr_devices/widget/home/calories_chart_widget.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/home/goal_widget.dart';
import 'package:polar_hr_devices/widget/home/sleeps_info_widget.dart';
import 'package:polar_hr_devices/widget/home/steps_chart_widget.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';
import 'package:polar_hr_devices/widget/home/mood_picker_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.crimsonRed20,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: dashboardController.screenHeight * 0.32,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: ColorPalette.crimsonRed20,
                        offset: Offset(0, 3),
                        blurRadius: 10)
                  ],
                  color: ColorPalette.crimsonRed20,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 34,
                              ),
                              IconWrapper(
                                  icon: Icons.favorite,
                                  backgroundColor: ColorPalette.crimsonRed35,
                                  iconColor: ColorPalette.crimsonRed),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: 'Your',
                                    color: ColorPalette.black75,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  CustomText(
                                    text: 'Heart Rate',
                                    color: ColorPalette.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Obx(() {
                                final snapshotData =
                                    dashboardController.hrData.value.toString();
                                return Row(
                                  children: [
                                    CustomText(
                                      text: snapshotData,
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const CustomText(
                                      text: ' bpm',
                                      fontSize: 14,
                                    )
                                  ],
                                );
                              }),
                              const SizedBox(
                                width: 34,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 164,
                      child: HrLinesChart(),
                    )
                  ],
                ),
              ),
              SizedBox(height: dashboardController.screenHeight * 0.01),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: 'Today Activity',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomText(
                          text: controller.formattedDate,
                          fontSize: 14,
                        ),
                      ],
                    )),
              ),
              Container(
                  width: dashboardController.screenWidth * 0.92,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: ColorPalette.ceruleanBlue20,
                        blurRadius: 5,
                        offset: Offset(0, 1),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const MoodPickerWidget()),
              SizedBox(height: dashboardController.screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CaloriesChartWidget(
                        width: dashboardController.screenWidth * 0.45,
                        height: dashboardController.screenHeight * 0.23,
                      ),
                      SizedBox(height: dashboardController.screenHeight * 0.01),
                      BMIChartWidget(
                        width: dashboardController.screenWidth * 0.45,
                        height: dashboardController.screenHeight * 0.23,
                      ),
                    ],
                  ),
                  SizedBox(width: dashboardController.screenHeight * 0.01),
                  Column(
                    children: [
                      GoalWidget(
                        width: dashboardController.screenWidth * 0.45,
                        height: dashboardController.screenHeight * 0.11,
                      ),
                      SizedBox(height: dashboardController.screenHeight * 0.01),
                      StepsChartWidget(
                        width: dashboardController.screenWidth * 0.45,
                        height: dashboardController.screenHeight * 0.23,
                      ),
                      SizedBox(height: dashboardController.screenHeight * 0.01),
                      SleepsInfoWidget(
                        width: dashboardController.screenWidth * 0.45,
                        height: dashboardController.screenHeight * 0.11,
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
