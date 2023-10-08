import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/modules/dashboard/views/settings/views/change_unit/change_unit_controller.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:horizontal_picker/horizontal_picker.dart';

class ChangeUnitPage extends GetView<ChangeUnitController> {
  const ChangeUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
              child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Change Weight',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    HorizontalPicker(
                      minValue: 0,
                      maxValue: 200,
                      divisions: 200,
                      height: 100,
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
                      height: 64,
                    ),
                    Text(
                      'Change Height',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    HorizontalPicker(
                      minValue: 0,
                      maxValue: 300,
                      divisions: 300,
                      height: 100,
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
                    const SizedBox(
                      height: 64,
                    ),
                    Text(
                      'Change Energy Unit',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildUnitMeasure(context, 'energy', 'Kcal'),
                          const SizedBox(width: 32),
                          _buildUnitMeasure(context, 'energy', 'KJ'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.isAllTrue.value
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).primaryColorDark.withOpacity(0.2),
                  ),
                  onPressed: () {
                    controller.saveUserInfo();
                    Get.offNamed(AppRoutes.dashboard);
                  },
                  child: const Text(
                    'Next',
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

    final ChangeUnitController changeUnitController =
        Get.put(ChangeUnitController());

    if (type == 'height') {
      isSelected = changeUnitController.heightUnit.value == unitMeasure;
    } else if (type == 'weight') {
      isSelected = changeUnitController.weightUnit.value == unitMeasure;
    } else if (type == 'energy') {
      isSelected = changeUnitController.energyUnit.value == unitMeasure;
    }
    return GestureDetector(
      onTap: () {
        if (type == 'height') {
          changeUnitController.changeHeightUnit(unitMeasure);
        } else if (type == 'weight') {
          changeUnitController.changeWeightUnit(unitMeasure);
        } else if (type == 'energy') {
          changeUnitController.changeEnergyUnit(unitMeasure);
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
