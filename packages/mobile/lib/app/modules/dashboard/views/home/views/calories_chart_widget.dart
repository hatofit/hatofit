import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/models/charts/calories_data.dart';
import 'package:hatofit/app/modules/dashboard/views/home/home_controller.dart';
import 'package:hatofit/app/services/preferences_service.dart';
import 'package:hatofit/app/themes/colors_constants.dart';
import 'package:hatofit/app/widget/icon_wrapper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CaloriesChartWidget extends GetView<HomeController> {
  const CaloriesChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = Get.width * 0.45;
    final height =Get.height * 0.24;
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Get.isDarkMode
              ? ColorConstants.darkContainer
              : ColorConstants.lightContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Burn',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                IconWrapper(
                  icon: Icons.local_fire_department,
                  backgroundColor: ColorConstants.purple.withOpacity(0.35),
                  iconColor: ColorConstants.purple,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.75,
              child: GetBuilder(
                  init: controller,
                  builder: (_) {
                    final store = Get.find<PreferencesService>();
                    return SfCircularChart(
                      annotations: <CircularChartAnnotation>[
                        CircularChartAnnotation(
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.calories.toStringAsFixed(0),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Text(
                                store.user!.metricUnits!.energyUnits!,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                      series: <CircularSeries>[
                        DoughnutSeries<CaloriesData, String>(
                          yValueMapper: (data, _) => data.y,
                          xValueMapper: (data, _) => data.x,
                          dataSource: [
                            CaloriesData('Remaining', controller.calories),
                            CaloriesData('Eaten', 100 - controller.calories),
                          ],
                          cornerStyle: CornerStyle.bothCurve,
                          radius: '100%',
                          innerRadius: '80%',
                          startAngle: 360,
                          endAngle: 360,
                          pointColorMapper: (CaloriesData data, _) =>
                              data.x == 'Remaining'
                                  ? ColorConstants.purple
                                  : const Color.fromARGB(255, 141, 101, 194),
                          enableTooltip: false,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
