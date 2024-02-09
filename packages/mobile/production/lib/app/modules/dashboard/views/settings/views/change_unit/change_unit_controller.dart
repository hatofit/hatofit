import 'package:get/get.dart';
import 'package:hatofit/app/models/user_model.dart';
import 'package:hatofit/app/services/internet_service.dart';

import '../../../../../../services/preferences_service.dart';

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

  final store = Get.find<PreferencesService>();

  @override
  void onInit() async {
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

  void saveUserInfo() async {
    final res = await InternetService()
        .updateMetrices(userHeight.value, userWeight.value, metricUnits);
 
    if (res.body['success'] == true) {
      store.user!.height = userHeight.value;
      store.user!.weight = userWeight.value;
      store.user!.metricUnits = metricUnits;
    }
  }

  Future<void> boolChecker() async {
    final w = store.user!.weight!;
    final h = store.user!.height!;
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
