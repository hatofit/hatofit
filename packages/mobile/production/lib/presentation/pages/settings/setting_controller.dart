import 'package:get/get.dart';
import 'package:polar_hr_devices/core/routes/app_routes.dart';

import '../../../core/utils/preferences_provider.dart';

class SettingController extends GetxController {
  final String title = 'Setting Title';
  final userName = ''.obs;
  final userAge = ''.obs;
  final isSync = false.obs;
  final _prefs = PreferencesProvider();

  @override
  Future<void> onInit() async {
    final firstName = await _prefs.getFirstName();
    final lastName = await _prefs.getLastName();
    userName.value = '$firstName $lastName';
    final dateOfBirth = await _prefs.getDateOfBirth();
    final age = DateTime.now().year - DateTime.parse(dateOfBirth!).year;
    userAge.value = age.toString();
    super.onInit();
  }

  void clear() {
    _prefs.clear();
    Get.offAllNamed(AppRoutes.greeting);
  }
}
