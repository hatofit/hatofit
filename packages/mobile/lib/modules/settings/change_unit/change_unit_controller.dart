import 'package:get/get.dart';
import 'package:polar_hr_devices/main.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class ChangeUnitController extends GetxController {
  final energyUnit = ''.obs;
  final heightUnit = ''.obs;
  final weightUnit = ''.obs;

  final storage = StorageService().storage;
  @override
  void onInit() {
    energyUnit.value = storage.read('energyUnit');
    heightUnit.value = storage.read('heightUnit');
    weightUnit.value = storage.read('weightUnit');
    print('=====================\n'
        'energyUnit: ${StorageService().storage.read('energyUnit')}\n'
        'heightUnit: ${StorageService().storage.read('heightUnit')}\n'
        'weightUnit: ${StorageService().storage.read('weightUnit')}\n'
        '=====================');
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
