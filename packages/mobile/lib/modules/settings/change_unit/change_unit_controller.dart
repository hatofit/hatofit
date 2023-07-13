import 'package:get/get.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/storage_service.dart';

class ChangeUnitController extends GetxController {
  final String title = 'Change Unit';
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
  void onReady() {
    energyUnit.value = storage.read('energyUnit');
    heightUnit.value = storage.read('heightUnit');
    weightUnit.value = storage.read('weightUnit');
    userWeight.value = storage.read('weight');
    userHeight.value = storage.read('height');
    super.onReady();
  }

  void changeEnergyUnit(String unitMeasure) {
    energyUnit.value = unitMeasure;
    isUserEnergySelected.value = true;
    storage.write('energyUnit', unitMeasure);
  }

  void changeHeightUnit(String unitMeasure) {
    heightUnit.value = unitMeasure;
    isUserHeightSelected.value = true;
    storage.write('heightUnit', unitMeasure);
    storage.write('height', userHeight.value);
  }

  void changeWeightUnit(String unitMeasure) {
    weightUnit.value = unitMeasure;
    isUserWeightSelected.value = true;
    storage.write('weightUnit', unitMeasure);
    storage.write('weight', userWeight.value);
  }

  void saveUserInfo() {
    if (heightUnit.value == 'cm') {
      storage.write('heightUnit', 'Centimeters');
    } else {
      storage.write('heightUnit', 'Feet');
    }
    if (heightUnit.value == 'kg') {
      storage.write('weightUnit', 'Kilograms');
    } else {
      storage.write('weightUnit', 'Lbs');
    }
    if (energyUnit.value == 'Kcal') {
      storage.write('energyUnit', 'Kcal');
      storage.write('energyUnit', 'Kcal');
      storage.write('height', userWeight.value);
      storage.write('weight', userWeight.value);
    }
    // print all user info
    print("=====================\n "
        "Name: ${storage.read('name')} \n"
        "Age : ${storage.read('age')}\n"
        "Height: ${storage.read('height')}\n"
        "Weight: ${storage.read('weight')}\n"
        "Heigh Unit : ${storage.read('heightUnit')}\n"
        "Weight Unit: ${storage.read('weightUnit')}\n"
        "Energy Unit: ${storage.read('energyUnit')}\n");
  }
}
