import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/controller/dashboard_controller.dart';
import 'package:polar_hr_devices/pages/excercise_detail_page.dart';
import 'package:polar_hr_devices/controller/workout_controller.dart';
import 'package:polar_hr_devices/widget/choose_mode_widget.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/day_calender_wrapper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WorkoutPage extends GetView<WorkoutController> {
  const WorkoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    final List<ProgressData> chartData = [ProgressData(1, 25)];
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
        screenColor: ColorPalette.royalBlue,
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: dashboardController.screenHeight * 0.221,
            width: dashboardController.screenWidth,
            decoration: const BoxDecoration(
              color: ColorPalette.royalBlue,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: dashboardController.screenHeight * 0.032,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DayWidget(
                      day: 'Sun',
                      date: 17,
                      isSelected: false,
                    ),
                    DayWidget(
                      day: 'Mon',
                      date: 18,
                      isSelected: false,
                    ),
                    DayWidget(
                      day: 'Tue',
                      date: 19,
                      isSelected: false,
                    ),
                    DayWidget(
                      day: 'Wed',
                      date: 20,
                      isSelected: true,
                    ),
                    DayWidget(
                      day: 'Thu',
                      date: 21,
                      isSelected: false,
                    ),
                    DayWidget(
                      day: 'Fri',
                      date: 22,
                      isSelected: false,
                    ),
                    DayWidget(
                      day: 'Sat',
                      date: 23,
                      isSelected: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: dashboardController.screenHeight * 0.02,
                ),
                SizedBox(
                  width: dashboardController.screenWidth * 0.9,
                  height: dashboardController.screenHeight * 0.01,
                  child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      primaryXAxis: CategoryAxis(
                        isVisible: false,
                      ),
                      primaryYAxis: NumericAxis(
                        isVisible: false,
                        minimum: 0,
                        maximum: 100,
                      ),
                      margin: EdgeInsets.zero,
                      series: <ChartSeries<ProgressData, double>>[
                        BarSeries<ProgressData, double>(
                          borderRadius: BorderRadius.circular(32),
                          width: 1,
                          dataSource: chartData,
                          isTrackVisible: true,
                          trackColor: ColorPalette.aqua50,
                          color: ColorPalette.aqua,
                          xValueMapper: (ProgressData data, _) => data.noList,
                          yValueMapper: (ProgressData data, _) => data.length,
                        ),
                      ]),
                ),
                SizedBox(
                  height: dashboardController.screenHeight * 0.016,
                ),
                SizedBox(
                  width: dashboardController.screenWidth * 0.9,
                  child: const CustomText(
                    text: '20 % of your goal completed',
                    fontSize: 10,
                    color: ColorPalette.black00,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: dashboardController.screenWidth * 0.9,
              height: dashboardController.screenHeight * 0.67,
              decoration: BoxDecoration(
                color: ColorPalette.black00,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: dashboardController.screenHeight * 0.015,
                      bottom: dashboardController.screenHeight * 0.01,
                    ),
                    child: const CustomText(
                      text: 'Choose Mode',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(
                    color: ColorPalette.black50,
                    thickness: 1,
                  ),
                  const ChooseModeWidget(),
                  SizedBox(
                    height: dashboardController.screenHeight * 0.015,
                  ),
                  SizedBox(
                    width: dashboardController.screenWidth * 0.9,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: dashboardController.screenHeight * 0.015,
                            bottom: dashboardController.screenHeight * 0.01,
                          ),
                          child: const CustomText(
                            text: 'Learn Exercise',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: dashboardController.screenHeight * 0.015,
                        ),
                        SizedBox(
                          height: dashboardController.screenHeight * 0.211,
                          width: dashboardController.screenWidth * 0.8,
                          child: ListView(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    Get.to(() => const ExcerciseDetailPage()),
                                child: Container(
                                  width: dashboardController.screenWidth * 0.8,
                                  height:
                                      dashboardController.screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.black,
                                    backgroundBlendMode: BlendMode.darken,
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomText(
                                          text: 'Full Body Exercise',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPalette.black00,
                                        ),
                                        SizedBox(
                                          height:
                                              dashboardController.screenHeight *
                                                  0.01,
                                        ),
                                        const CustomText(
                                          text:
                                              'Follow full body exercise video workouts and monitoring your heart rate',
                                          fontSize: 14,
                                          color: ColorPalette.black00,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    dashboardController.screenHeight * 0.015,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: dashboardController.screenWidth * 0.8,
                                  height:
                                      dashboardController.screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.black,
                                    backgroundBlendMode: BlendMode.darken,
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomText(
                                          text: 'Full Body Exercise',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPalette.black00,
                                        ),
                                        SizedBox(
                                          height:
                                              dashboardController.screenHeight *
                                                  0.01,
                                        ),
                                        const CustomText(
                                          text:
                                              'Follow full body exercise video workouts and monitoring your heart rate',
                                          fontSize: 14,
                                          color: ColorPalette.black00,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    dashboardController.screenHeight * 0.015,
                              ),
                              GestureDetector(
                                child: Container(
                                  width: dashboardController.screenWidth * 0.8,
                                  height:
                                      dashboardController.screenHeight * 0.12,
                                  decoration: BoxDecoration(
                                    color: ColorPalette.black,
                                    backgroundBlendMode: BlendMode.darken,
                                    image: const DecorationImage(
                                      image: AssetImage('assets/images/1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomText(
                                          text: 'Full Body Exercise',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: ColorPalette.black00,
                                        ),
                                        SizedBox(
                                          height:
                                              dashboardController.screenHeight *
                                                  0.01,
                                        ),
                                        const CustomText(
                                          text:
                                              'Follow full body exercise video workouts and monitoring your heart rate',
                                          fontSize: 14,
                                          color: ColorPalette.black00,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
