import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

import 'input_user_metric_controller.dart';

class InputUserMetricPage extends GetView<InputUserMetricController> {
  const InputUserMetricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
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
                    Text(
                      'Pick your Weight',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    HorizontalPicker(
                      minValue: 0,
                      maxValue: 200,
                      divisions: 200,
                      height: 150,
                      showCursor: true,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      activeItemTextColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        controller.userWeight.value = value.toInt();
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildUnitMeasure(context, 'weight', 'kg'),
                          const SizedBox(width: 32),
                          _buildUnitMeasure(context, 'weight', 'lbs'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 84,
                    ),
                    Text(
                      'Pick your Height',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    HorizontalPicker(
                      minValue: 0,
                      maxValue: 300,
                      divisions: 300,
                      height: 150,
                      showCursor: true,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      activeItemTextColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        controller.userHeight.value = value.toInt();
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildUnitMeasure(context, 'height', 'cm'),
                          const SizedBox(width: 32),
                          _buildUnitMeasure(context, 'height', 'ft'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.isUserHeightSelected.value ==
                                  true &&
                              controller.isUserWeightSelected.value == true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColorDark.withOpacity(0.2),
                    ),
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                            if (controller.isUserHeightSelected.value == true &&
                                controller.isUserWeightSelected.value == true) {
                              controller.saveUserInfo();
                            }
                          },
                    child: controller.isLoading.value == true
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text('Register'),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildUnitMeasure(
      BuildContext context, String type, String unitMeasure) {
    var isSelected = false;

    final InputUserMetricController inputUserMetricController =
        Get.put(InputUserMetricController());

    if (type == 'height') {
      isSelected = inputUserMetricController.selectedHeightUnitMeasure.value ==
          unitMeasure;
    } else if (type == 'weight') {
      isSelected = inputUserMetricController.selectedWeightUnitMeasure.value ==
          unitMeasure;
    }
    return GestureDetector(
      onTap: () {
        if (type == 'height') {
          inputUserMetricController.selectHeightUnitMeasure(unitMeasure);
        } else if (type == 'weight') {
          inputUserMetricController.selectWeightUnitMeasure(unitMeasure);
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
              : Colors.grey.withOpacity(0.5),
        ),
        height: 48,
        width: 148,
        child: Center(
          child: Text(
            unitMeasure,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: isSelected ? Colors.white : Colors.black, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
