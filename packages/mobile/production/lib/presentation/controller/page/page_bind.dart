import 'package:get/get.dart';
import 'package:hatofit/data/repos/image_repo_iml.dart';
import 'package:hatofit/data/repos/report_repo_iml.dart';
import 'package:hatofit/data/repos/session_repo_iml.dart';
import 'package:hatofit/data/repos/workout_repo_iml.dart';
import 'package:hatofit/domain/usecases/api/report/fetch_report_api_uc.dart';
import 'package:hatofit/domain/usecases/api/sesion/fetch_session_api_uc.dart';
import 'package:hatofit/domain/usecases/image_camera_uc.dart';
import 'package:hatofit/domain/usecases/local/workout/fetch_workout_local_uc.dart';
import 'package:hatofit/domain/usecases/local/workout/save_workout_local_uc.dart';

import '../../../domain/usecases/api/workout/fetch_workout_api_uc.dart';
import 'page_con.dart';

class PageBind extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WorkoutRepoIml());
    Get.lazyPut(() => SessionRepoIml());
    Get.lazyPut(() => ReportRepoIml());
    Get.lazyPut(() => ImageRepoIml());

    Get.lazyPut(() => FetchWorkoutLocalUC(Get.find<WorkoutRepoIml>()));
    Get.lazyPut(() => FetchWorkoutApiUC(Get.find<WorkoutRepoIml>()));
    Get.lazyPut(() => SaveWorkoutLocalUC(Get.find<WorkoutRepoIml>()));
    Get.lazyPut(() => FetchSessionApiUC(Get.find<SessionRepoIml>()));
    Get.lazyPut(() => FetchReportApiUC(Get.find<ReportRepoIml>()));
    Get.lazyPut(() => ImageCameraUC(Get.put(ImageRepoIml())));

    Get.lazyPut(
      () => PageCon(
        Get.find<FetchWorkoutLocalUC>(),
        Get.find<FetchWorkoutApiUC>(),
        Get.find<SaveWorkoutLocalUC>(),
        Get.find<FetchSessionApiUC>(),
        Get.find<FetchReportApiUC>(),
        Get.find<ImageCameraUC>(),
      ),
    );
  }
}
