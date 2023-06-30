import 'package:get/get.dart';
import 'package:polar_hr_devices/main.dart';

class ChangeUnitController extends GetxController {
  RxString energyUnit = ''.obs;
  RxString heightUnit = ''.obs;
  RxString weightUnit = ''.obs;

  @override
  void onInit() {
    energyUnit.value = storage.read('energyUnit');
    heightUnit.value = storage.read('heightUnit');
    weightUnit.value = storage.read('weightUnit');
    super.onInit();
  }

  void changeEnergyUnit(String unit) {
    energyUnit.value = unit;
    storage.write('energyUnit', unit);
  }

  void changeHeightUnit(String unit) {
    heightUnit.value = unit;
    storage.write('heightUnit', unit);
  }

  void changeWeightUnit(String unit) {
    weightUnit.value = unit;
    storage.write('weightUnit', unit);
  }
}
