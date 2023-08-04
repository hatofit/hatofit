import 'package:get/get.dart';
import 'package:polar_hr_devices/models/auth_model.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

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

  final storage = StorageService().storage;

  @override
  void onInit() {
    metricUnits = MetricUnits.fromJson(storage.read('metricUnits'));
    userHeight.value = storage.read('height');
    userWeight.value = storage.read('weight');
    energyUnit.value = metricUnits.energyUnits!;
    heightUnit.value = metricUnits.heightUnits!;
    weightUnit.value = metricUnits.weightUnits!;
    super.onInit();
  }

  void changeEnergyUnit(String unitMeasure) {
    energyUnit.value = unitMeasure;
    isUserEnergySelected.value = true;
    metricUnits.energyUnits = unitMeasure;
  }

  void changeHeightUnit(String unitMeasure) {
    heightUnit.value = unitMeasure;
    isUserHeightSelected.value = true;
    metricUnits.heightUnits = unitMeasure;
  }

  void changeWeightUnit(String unitMeasure) {
    weightUnit.value = unitMeasure;
    isUserWeightSelected.value = true;
    metricUnits.weightUnits = unitMeasure;
  }

  void saveUserInfo() {
    storage.write('metricUnits', metricUnits.toJson());
    storage.write('height', userHeight.value);
    storage.write('weight', userWeight.value);
    Get.back();
  }
}
