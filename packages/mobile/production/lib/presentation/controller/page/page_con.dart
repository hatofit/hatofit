import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/app/utils/date_utils.dart';
import 'package:hatofit/domain/usecases/api/report/fetch_report_api_uc.dart';
import 'package:hatofit/domain/usecases/api/sesion/fetch_session_api_uc.dart';
import 'package:hatofit/domain/usecases/local/workout/save_workout_local_uc.dart';
import 'package:hatofit/presentation/pages/history/view/history_detail_page.dart';

import '../../../app/routes/app_routes.dart';
import '../../../data/models/exercise.dart';
import '../../../data/models/user.dart';
import '../../../domain/usecases/api/workout/fetch_workout_api_uc.dart';
import '../../../domain/usecases/local/workout/fetch_workout_local_uc.dart';

class PageCon extends GetxController {
  PageCon(
    this._fetchWorkoutLocalUC,
    this._fetchWorkoutApiUC,
    this._saveWorkoutLocalUC,
    this._fetchSessionApiUC,
    this._fetchReportApiUC,
  );

  ///
  ///General Data
  ///
  final LocalStorageService _store = Get.find<LocalStorageService>();
  var user = Rx<User?>(null);
  final _now = DateTime.now();

  @override
  void onInit() {
    /// General Data
    user.value = _store.user;

    /// Home Page
    homeTitle.value = 'Hi, ${user.value?.firstName}';

    /// History Page
    // fetchHistory();
    super.onInit();
  }

  ///
  /// Bottom navigation bar Controller
  ///
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  ///
  /// Home Page Controller
  ///
  final homeTitle = ''.obs;
  String get formattedDate => '${_now.day}/${_now.month}/${_now.year}';

  ///
  /// Workout Page Controller
  ///
  final FetchWorkoutLocalUC _fetchWorkoutLocalUC;
  final FetchWorkoutApiUC _fetchWorkoutApiUC;
  final SaveWorkoutLocalUC _saveWorkoutLocalUC;
  goToWorkoutDetail(Exercise exercise) {
    Get.toNamed(AppRoutes.workoutDetail, arguments: exercise);
  }

  var exercises = <Exercise>[].obs;
  Future<List<Exercise>> fetchExercises() async {
    final data = await _fetchWorkoutApiUC.execute();
    data.fold((l) async {
      Get.snackbar(l.message, l.details);
      Get.snackbar('Alert', 'Using local data');
      final data = await _fetchWorkoutLocalUC.execute();
      data.fold((l) => Get.snackbar(l.code, l.message),
          (r) => exercises.value = r.data);
    }, (r) {
      exercises.value = r.data['exercises']
          .map<Exercise>((e) => Exercise.fromJson(e))
          .toList();
      _saveWorkoutLocalUC.execute(r.data);
    });
    return exercises;
  }

  ///
  /// History Page Controller
  ///

  final FetchSessionApiUC _fetchSessionApiUC;
  final FetchReportApiUC _fetchReportApiUC;

  final RxList<dynamic> historyData = [].obs;
  Future<List<dynamic>> fetchHistory() async {
    final token = _store.token;
    final data = await _fetchSessionApiUC.execute(token!);
    data.fold((l) async {
      Get.snackbar(l.message, l.details);
      Get.snackbar('Alert', 'Using local data');
      final data = await _fetchWorkoutLocalUC.execute();
      data.fold((l) => Get.snackbar(l.code, l.message),
          (r) => historyData.value = r.data);
    }, (r) {
      historyData.value = r.data['sessions'];
    });
    return historyData;
  }

  void navigateHistoryDetail(String id) {
    Get.to(
      () => HistoryDetailPage(_fetchReportApiUC.execute(id)),
      transition: Transition.cupertino,
    );
  }

  String formattedDateHistory(String date) {
    return DateUtils.monthToWord(date);
  }

  ///
  /// Setting Page Controller
  ///
  int get userAge => _now.year - (user.value?.dateOfBirth?.year ?? 0);
  ImageProvider<Object> get userImage {
    if (user.value!.photo == 'No Photo') {
      if (user.value!.gender == 'male') {
        return const AssetImage('assets/images/male.png');
      } else {
        return const AssetImage('assets/images/female.png');
      }
    } else {
      return FileImage(File(
          '/storage/emulated/0/Android/data/com.example.hatofit/files/photo-profile.jpg'));
    }
  }

  void logout() async {
    await _store.clear();
    Get.offAllNamed(AppRoutes.greeting);
  }
}
