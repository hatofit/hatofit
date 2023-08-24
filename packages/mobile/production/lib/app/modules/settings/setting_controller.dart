import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';

import '../../services/preferences_service.dart';

class SettingController extends GetxController {
  final String title = 'Setting Title';
  final userName = ''.obs;
  final userAge = ''.obs;
  final isSync = false.obs;
  final store = Get.find<PreferencesService>();

  @override
  Future<void> onInit() async {
    final firstName = store.user!.firstName!;
    final lastName = store.user!.lastName!;
    userName.value = '$firstName $lastName';
    final dateOfBirth = store.user!.dateOfBirth;
    final age = DateTime.now().year - dateOfBirth!.year;
    userAge.value = age.toString();
    super.onInit();
  }

  void clear() {
    store.clear();
    Get.offAllNamed(AppRoutes.greeting);
  }
}
