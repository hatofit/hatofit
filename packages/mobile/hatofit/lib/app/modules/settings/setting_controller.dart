import 'package:get/get.dart';
import 'package:hatofit/app/routes/app_routes.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../services/preferences_service.dart';

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
  DATA_ADDED,
  DATA_DELETED,
  DATA_NOT_ADDED,
  DATA_NOT_DELETED,
  STEPS_READY,
}

class SettingController extends GetxController {
  final String title = 'Setting Title';
  final userName = ''.obs;
  final userAge = ''.obs;
  final isSync = false.obs;
  final store = Get.find<PreferencesService>();
  AppState _state = AppState.DATA_NOT_FETCHED;
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

  final List<HealthDataPoint> _healthDataList = [];

  static final types = [
    HealthDataType.HEART_RATE,
    HealthDataType.WEIGHT,
    HealthDataType.HEIGHT,
    HealthDataType.STEPS,
    HealthDataType.WORKOUT,
  ];

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();
  Future handleGoogleFit() async {
    authorize();
    // await Permission.activityRecognition.request();

    // final now = DateTime.now();
    // final yesterday = now.subtract(Duration(hours: 24));
    // await health.hasPermissions(types, permissions: permissions);
    // _healthDataList.clear();
    // try {
    //   List<HealthDataPoint> healthData =
    //       await health.getHealthDataFromTypes(yesterday, now, types);
    //   _healthDataList.addAll(
    //       (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
    // } catch (error) {
    //   print("Exception in getHealthDataFromTypes: $error");
    // }

    // _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

    // for (var x in _healthDataList) {
    //   logger.i(
    //       "Data point: $x dateFrom: ${x.dateFrom} dateTo: ${x.dateTo} value: ${x.value} unit: ${x.unit}");
    // }
  }

  Future authorize() async {
    // If we are trying to read Step Count, Workout, Sleep or other data that requires
    // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
    // This requires a special request authorization call.
    //
    // The location permission is requested for Workouts using the Distance information.
    await Permission.activityRecognition.request();
    await Permission.location.request();

    // Check if we have permission
    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);

    // hasPermissions = false because the hasPermission cannot disclose if WRITE access exists.
    // Hence, we have to request with WRITE as well.
    hasPermissions = false;

    bool authorized = false;
    if (!hasPermissions) {
      // requesting access to the data types before reading them
      try {
        authorized =
            await health.requestAuthorization(types, permissions: permissions);
      } catch (error) {
        print("Exception in authorize: $error");
      }
    }

    _state = authorized ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED;
  }
}
