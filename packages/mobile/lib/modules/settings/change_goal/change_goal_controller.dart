import 'package:get/get.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class ChangeGoalController extends GetxController {
  RxString energyUnit = ''.obs;
  RxString heightUnit = ''.obs;
  RxString weightUnit = ''.obs;
  final storage = StorageService().storage;

  @override
  void onInit() {
    energyUnit.value =  storage.read('energyUnit');
    heightUnit.value =  storage.read('heightUnit');
    weightUnit.value =  storage.read('weightUnit');
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
