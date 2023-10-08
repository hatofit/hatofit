import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/home/home_controller.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/app_theme.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/appBar/custom_app_bar.dart';
import 'package:hatofit/app/widget/home/bmi_chart_widget.dart';
import 'package:hatofit/app/widget/home/calories_chart_widget.dart';
import 'package:hatofit/app/widget/home/exercise_now_widget.dart';
import 'package:hatofit/app/widget/home/hr_lines_chart.dart';
import 'package:hatofit/app/widget/home/mood_picker_widget.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bleService = Get.find<BluetoothService>();
    final store = Get.find<PreferencesService>();
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Hi, ${store.user!.firstName!} 👋',
        ),
        body: RefreshIndicator(
          onRefresh: () {
            controller.hrCharting();
            controller.update();
            return Future.delayed(const Duration(seconds: 1));
          },
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (_, i) => Column(
              children: [
                Obx(() {
                  final dvcs = bleService.detectedDevices
                      .where((p0) => p0.isConnect.value == true)
                      .toList();
                  // dvcs.isEmpty ? const SizedBox() : controller.update();
                  return ListView.builder(
                    itemCount: dvcs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final device = dvcs[index];
                      return Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeManager().isDarkMode
                              ? ColorConstants.darkContainer
                              : ColorConstants.lightContainer,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconWrapper(
                                  icon: Icons.favorite,
                                  backgroundColor: ColorConstants.crimsonRed
                                      .withOpacity(0.35),
                                  iconColor: ColorConstants.crimsonRed,
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Current',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      'Heart Rate',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Text(
                                      '${device.info.name} ${device.info.deviceId}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Obx(
                                  () => Text(
                                    device.hr.value.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                ),
                                Text(
                                  ' bpm',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
                // Container(
                //   padding: const EdgeInsets.all(16),
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 8,
                //     vertical: 4,
                //   ),
                //   decoration: BoxDecoration(
                //     color: ThemeManager().isDarkMode
                //         ? ColorConstants.darkContainer
                //         : ColorConstants.lightContainer,
                //     borderRadius: const BorderRadius.all(
                //       Radius.circular(16),
                //     ),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Row(
                //         children: [
                //           IconWrapper(
                //               icon: Icons.favorite,
                //               backgroundColor:
                //                   ColorConstants.crimsonRed.withOpacity(0.35),
                //               iconColor: ColorConstants.crimsonRed),
                //           const SizedBox(
                //             width: 16,
                //           ),
                //           Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Your current',
                //                 style: Theme.of(context).textTheme.bodyMedium,
                //               ),
                //               Text(
                //                 'Heart Rate',
                //                 style: Theme.of(context).textTheme.displaySmall,
                //               ),
                //             ],
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Row(
                //             children: [
                //               Obx(
                //                 () => Text(
                //                   bleService.detectedDevices.isEmpty
                //                       ? '--'
                //                       : ' ',
                //                   style:
                //                       Theme.of(context).textTheme.displayLarge,
                //                 ),
                //                 //  Text(
                //                 //   bleService.heartRate.value == 0
                //                 //       ? '--'
                //                 //       : bleService.heartRate.value.toString(),
                //                 //   style:
                //                 //       Theme.of(context).textTheme.displayLarge,
                //                 // ),
                //               ),
                //               Text(
                //                 ' bpm',
                //                 style: Theme.of(context).textTheme.bodyMedium,
                //               )
                //             ],
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                GetBuilder(
                    init: controller,
                    builder: (_) {
                      return controller.hrData.isEmpty
                          ? const SizedBox()
                          : Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ThemeManager().isDarkMode
                                    ? ColorConstants.darkContainer
                                    : ColorConstants.lightContainer,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IconWrapper(
                                        icon: Icons.show_chart_rounded,
                                        iconColor: ColorConstants.crimsonRed,
                                        backgroundColor: ColorConstants
                                            .crimsonRed
                                            .withOpacity(0.35),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Text(
                                        'Exercise History',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.02,
                                  ),
                                  GetBuilder(
                                      init: controller,
                                      builder: (_) {
                                        return SizedBox(
                                          height: Get.height * 0.3,
                                          child: HrLinesChart(
                                              hrData: controller.hrData),
                                        );
                                      }),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GetBuilder(
                                        init: controller,
                                        builder: (_) {
                                          return Text(
                                            'Last Exercise: ${controller.lastExercise ?? '--'}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            );
                    }),
                Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    // width: width,
                    padding: const EdgeInsets.all(16),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? ColorConstants.darkContainer
                          : ColorConstants.lightContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const ExerciseNowWidget()),
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
                SizedBox(height: Get.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const CaloriesChartWidget(),
                        SizedBox(height: Get.height * 0.01),
                      ],
                    ),
                    SizedBox(width: Get.height * 0.01),
                    Column(
                      children: [
                        const BMIChartWidget(),
                        SizedBox(height: Get.height * 0.01),

                        // const StepsChartWidget(),
                        // SizedBox(height: Get.height * 0.01),
                        // const SleepsInfoWidget(),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
