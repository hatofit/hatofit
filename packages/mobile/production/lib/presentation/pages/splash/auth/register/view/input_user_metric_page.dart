import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/data/models/user.dart';
import 'package:hatofit/presentation/controller/auth/auth_con.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

import '../../../../../controller/reg/reg_con.dart';

class InputUserMetricPage extends GetView<RegCon> {
  const InputUserMetricPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCon = Get.find<AuthCon>();
    return Scaffold(
        body: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Container(
                      padding: const EdgeInsets.only(top: 64),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Pick your Weight',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                            HorizontalPicker(
                                minValue: 0,
                                maxValue: 200,
                                divisions: 200,
                                height: 150,
                                showCursor: true,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                activeItemTextColor:
                                    Theme.of(context).primaryColor,
                                onChanged: (value) {
                                  controller.userWeight.value = value.toInt();
                                }),
                            const SizedBox(height: 8),
                            SizedBox(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  _buildUnitMeasure(
                                      context: context,
                                      type: WeightUnits,
                                      unitMeasure: WeightUnits.kg,
                                      regCon: controller),
                                  const SizedBox(width: 32),
                                  _buildUnitMeasure(
                                      context: context,
                                      type: WeightUnits,
                                      unitMeasure: WeightUnits.lbs,
                                      regCon: controller)
                                ])),
                            const SizedBox(height: 84),
                            Text('Pick your Height',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                            HorizontalPicker(
                                minValue: 0,
                                maxValue: 300,
                                divisions: 300,
                                height: 150,
                                showCursor: true,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                activeItemTextColor:
                                    Theme.of(context).primaryColor,
                                onChanged: (value) {
                                  controller.userHeight.value = value.toInt();
                                }),
                            const SizedBox(height: 8),
                            SizedBox(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                  _buildUnitMeasure(
                                      context: context,
                                      type: HeightUnits,
                                      unitMeasure: HeightUnits.cm,
                                      regCon: controller),
                                  const SizedBox(width: 32),
                                  _buildUnitMeasure(
                                      context: context,
                                      type: HeightUnits,
                                      unitMeasure: HeightUnits.ft,
                                      regCon: controller)
                                ]))
                          ])),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: controller
                                              .isUserHeightSelected.value ==
                                          true &&
                                      controller.isUserWeightSelected.value ==
                                          true
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.2)),
                          onPressed: () async {
                            if (controller.isUserHeightSelected.value == true &&
                                controller.isUserWeightSelected.value == true) {
                              await controller.getUserData().then((value) {
                                authCon.register(value);
                              });
                            }
                          },
                          child: const Text('Next')))
                ])))));
  }

  Widget _buildUnitMeasure(
      {required BuildContext context,
      required Type type,
      required dynamic unitMeasure,
      required RegCon regCon}) {
    var isSelected = false;

    if (type == HeightUnits) {
      isSelected = regCon.selectedHeightUnitMeasure.value == unitMeasure;
    } else if (type == WeightUnits) {
      isSelected = regCon.selectedWeightUnitMeasure.value == unitMeasure;
    }
    return GestureDetector(
        onTap: () {
          if (type == HeightUnits) {
            regCon.selectHeightUnitMeasure(unitMeasure);
          } else if (type == WeightUnits) {
            regCon.selectWeightUnitMeasure(unitMeasure);
          }
        },
        child: AnimatedContainer(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey.withOpacity(0.5)),
            height: 48,
            width: 148,
            child: Center(
                child: Text(unitMeasure,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 16)))));
  }
}
