import 'package:get/get.dart';
import 'package:hatofit/app/services/bluetooth_service.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/data/repos/image_repo_iml.dart';
import 'package:hatofit/data/repos/report_repo_iml.dart';
import 'package:hatofit/data/repos/session_repo_iml.dart';
import 'package:hatofit/data/repos/workout_repo_iml.dart';

import '../../data/repos/auth_repo_iml.dart';

class DI {
  static init() {
    Get.lazyPut(() => AuthRepoIml());
    Get.lazyPut(() => ImageRepoIml());
    Get.lazyPut(() => WorkoutRepoIml());
    Get.lazyPut(() => SessionRepoIml());
    Get.lazyPut(() => ReportRepoIml());
  }

  static initServices() async {
    await Get.putAsync(() => LocalStorageService().init());
    // await Get.putAsync(() => StorageService().init());
    await Get.putAsync(() => BluetoothService().init());
  }
}
