import 'package:get/get.dart';
import 'package:polar_hr_devices/models/auth_model.dart';

import '../../../utils/preferences_provider.dart';

class ChangeUnitController extends GetxController {
  final String title = 'Change Unit';
  MetricUnits metricUnits = MetricUnits();
  final energyUnit = ''.obs;
  final heightUnit = ''.obs;
  final weightUnit = ''.obs;
  final userWeight = 100.obs;
  final userHeight = 150.obs;
  final isUserWeightSelected = false.obs;
  final isUserHeightSelected = false.obs;
  final isUserEnergySelected = false.obs;
  final isAllTrue = false.obs;

  final _prefs = PreferencesProvider();
  PreferencesProvider get prefs => _prefs;

  @override
  void onInit() async {
    final mUnits = await _prefs.getMetricUnits();
    metricUnits.energyUnits = mUnits[0];
    metricUnits.heightUnits = mUnits[1];
    metricUnits.weightUnits = mUnits[2];
    energyUnit.value = metricUnits.energyUnits!;
    heightUnit.value = metricUnits.heightUnits!;
    weightUnit.value = metricUnits.weightUnits!;
    boolChecker();
    super.onInit();
  }

  void changeEnergyUnit(String unitMeasure) {
    energyUnit.value = unitMeasure;
    isUserEnergySelected.value = true;
    metricUnits.energyUnits = unitMeasure;
    boolChecker();
  }

  void changeHeightUnit(String unitMeasure) {
    heightUnit.value = unitMeasure;
    isUserHeightSelected.value = true;
    metricUnits.heightUnits = unitMeasure;
    boolChecker();
  }

  void changeWeightUnit(String unitMeasure) {
    weightUnit.value = unitMeasure;
    isUserWeightSelected.value = true;
    metricUnits.weightUnits = unitMeasure;
    boolChecker();
  }

  void saveUserInfo() {
    Get.back();
  }

  Future<void> boolChecker() async {
    final w = await _prefs.getWeight();
    final h = await _prefs.getHeight();
    if (w != userWeight.value ||
        h != userHeight.value ||
        isUserWeightSelected.value == true ||
        isUserHeightSelected.value == true ||
        isUserEnergySelected.value == true) {
      isAllTrue.value = true;
    } else {
      isAllTrue.value = false;
    }
  }
}
