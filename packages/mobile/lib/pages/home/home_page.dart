import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:polar_hr_devices/pages/dashboard/dashboard_controller.dart';
import 'package:polar_hr_devices/pages/home/home_controller.dart';
import 'package:polar_hr_devices/data/colors_pallete_hex.dart';
import 'package:polar_hr_devices/models/hr_lines_chart.dart';
import 'package:polar_hr_devices/widget/custom_app_bar.dart';
import 'package:polar_hr_devices/widget/custom_text.dart';
import 'package:polar_hr_devices/widget/home_screen_widget.dart';
import 'package:polar_hr_devices/widget/icon_wrapper.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find();
    return Scaffold(
      appBar: CustomAppBar(
        title: DateFormat('d MMMM y').format(controller.title),
        screenColor: ColorPalette.crimsonRed20,
      ),
      body: Column(
        children: [
          Container(
            height: dashboardController.screenHeight * 0.35,
            decoration: const BoxDecoration(
                color: ColorPalette.crimsonRed20,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(64),
                    bottomRight: Radius.circular(64))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 34,
                        ),
                        IconWrapper(
                            icon: Icons.favorite_border,
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
                              controller.streamingService.hrData.value;
                          return CustomText(
                            text: snapshotData,
                            fontSize: 48,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                          );
                        }),
                        const SizedBox(
                          width: 34,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 164,
                  child: HrLinesChart(),
                )
              ],
            ),
          ),
          SizedBox(height: dashboardController.screenHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  HomeWrapperWidget(
                    text: 'Calories',
                    index: 0,
                    width: dashboardController.screenWidth * 0.45,
                    height: dashboardController.screenHeight * 0.3,
                    firstColor: ColorPalette.purple20,
                    secondColor: ColorPalette.purple35,
                    thirdColor: ColorPalette.purple,
                    icon: Icons.local_fire_department,
                  ),
                  SizedBox(height: dashboardController.screenHeight * 0.01),
                  HomeWrapperWidget(
                    text: 'Sleep',
                    index: 1,
                    width: dashboardController.screenWidth * 0.45,
                    height: dashboardController.screenHeight * 0.15,
                    firstColor: ColorPalette.aqua20,
                    secondColor: ColorPalette.aqua35,
                    thirdColor: ColorPalette.aqua,
                    icon: Icons.bedtime,
                  ),
                ],
              ),
              SizedBox(width: dashboardController.screenHeight * 0.01),
              Column(
                children: [
                  HomeWrapperWidget(
                    text: 'Water',
                    index: 2,
                    width: dashboardController.screenWidth * 0.45,
                    height: dashboardController.screenHeight * 0.25,
                    firstColor: ColorPalette.ceruleanBlue20,
                    secondColor: ColorPalette.ceruleanBlue35,
                    thirdColor: ColorPalette.ceruleanBlue,
                    icon: Icons.water_drop,
                  ),
                  SizedBox(height: dashboardController.screenHeight * 0.01),
                  HomeWrapperWidget(
                    text: 'Weight',
                    index: 3,
                    width: dashboardController.screenWidth * 0.45,
                    height: dashboardController.screenHeight * 0.2,
                    firstColor: ColorPalette.orangeYellow20,
                    secondColor: ColorPalette.orangeYellow35,
                    thirdColor: ColorPalette.orangeYellow,
                    icon: Icons.monitor_weight,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
