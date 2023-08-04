import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/modules/home/home_controller.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/services/polar_service.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';
import 'package:polar_hr_devices/widget/home/hr_lines_chart.dart';
import 'package:polar_hr_devices/widget/home/bmi_chart_widget.dart';
import 'package:polar_hr_devices/widget/home/calories_chart_widget.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/home/goal_widget.dart';
import 'package:polar_hr_devices/widget/home/sleeps_info_widget.dart';
import 'package:polar_hr_devices/widget/home/steps_chart_widget.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';
import 'package:polar_hr_devices/widget/home/mood_picker_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final polarService = Get.find<PolarService>();
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: ThemeManager().screenHeight * 0.32,
                decoration: BoxDecoration(
                  color: ThemeManager().isDarkMode
                      ? ColorConstants.darkContainer
                      : ColorConstants.lightContainer,
                  borderRadius: const BorderRadius.only(
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
                          Row(
                            children: [
                              const SizedBox(
                                width: 34,
                              ),
                              IconWrapper(
                                  icon: Icons.favorite,
                                  backgroundColor: ColorConstants.crimsonRed
                                      .withOpacity(0.35),
                                  iconColor: ColorConstants.crimsonRed),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'Heart Rate',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Obx(() => Text(
                                        polarService.heartRate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                      )),
                                  Text(
                                    ' bpm',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 34,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 164,
                      child: HrLinesChart(),
                    )
                  ],
                ),
              ),
              SizedBox(height: ThemeManager().screenHeight * 0.01),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today Activity',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        Text(
                          controller.formattedDate,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    )),
              ),
              const MoodPickerWidget(),
              SizedBox(height: ThemeManager().screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CaloriesChartWidget(
                        width: ThemeManager().screenWidth * 0.45,
                        height: ThemeManager().screenHeight * 0.23,
                      ),
                      SizedBox(height: ThemeManager().screenHeight * 0.01),
                      BMIChartWidget(
                        width: ThemeManager().screenWidth * 0.45,
                        height: ThemeManager().screenHeight * 0.23,
                      ),
                    ],
                  ),
                  SizedBox(width: ThemeManager().screenHeight * 0.01),
                  Column(
                    children: [
                      GoalWidget(
                        width: ThemeManager().screenWidth * 0.45,
                        height: ThemeManager().screenHeight * 0.11,
                      ),
                      SizedBox(height: ThemeManager().screenHeight * 0.01),
                      StepsChartWidget(
                        width: ThemeManager().screenWidth * 0.45,
                        height: ThemeManager().screenHeight * 0.23,
                      ),
                      SizedBox(height: ThemeManager().screenHeight * 0.01),
                      SleepsInfoWidget(
                        width: ThemeManager().screenWidth * 0.45,
                        height: ThemeManager().screenHeight * 0.11,
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
