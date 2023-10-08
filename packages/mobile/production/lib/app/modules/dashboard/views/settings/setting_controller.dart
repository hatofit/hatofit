import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:hatofit/utils/snackbar.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../services/preferences_service.dart';

class SettingController extends GetxController {
  final String title = 'Setting Title';
  final userName = ''.obs;
  final userAge = ''.obs;
  final authorized = false.obs;
  final store = Get.find<PreferencesService>();
  @override
  Future<void> onInit() async {
    final firstName = store.user!.firstName!;
    final lastName = store.user!.lastName!;
    userName.value = '$firstName $lastName';
    final dateOfBirth = store.user!.dateOfBirth;
    final age = DateTime.now().year - dateOfBirth!.year;
    userAge.value = age.toString();
    handleGoogleFit();
    super.onInit();
  }

  void clear() {
    store.clear();
    Get.offAllNamed(AppRoutes.greeting);
  }

  static final types = [
    HealthDataType.HEART_RATE,
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.STEPS,
    HealthDataType.SLEEP_ASLEEP,
  ];

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();
  Future handleGoogleFit() async {
    authorize();
  }

  Future authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);
    hasPermissions = false;

    if (!hasPermissions) {
      try {
        authorized.value =
            await health.requestAuthorization(types, permissions: permissions);
        if (authorized.value) {
          MySnackbar.success('Success', 'Successfully authorized');
        } else {
          MySnackbar.error('Error', 'Error while trying to authorize');
        }
      } catch (error) {
        MySnackbar.error('Error', 'Error while trying to authorize');
      }
    }
  }
}
