import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hatofit/app/services/local_storage.dart';
import 'package:hatofit/app/utils/date_utils.dart';

import '../../../app/routes/app_routes.dart';
import '../../../app/services/internet_service.dart';
import '../../../data/models/exercise.dart';
import '../../../data/models/user.dart';
import '../../../domain/usecases/exercise_api_uc.dart';
import '../../../domain/usecases/exercise_local_uc.dart';

class PageCon extends GetxController {
  PageCon(this._exerciseLocalUC, this._exerciseApiUC);

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
    fetchHistory();
    super.onInit();
  }

  /// Bottom navigation bar Controller
  var tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }

  /// Home Page Controller
  final homeTitle = ''.obs;
  String get formattedDate => '${_now.day}/${_now.month}/${_now.year}';

  /// Workout Page Controller
  final ExerciseLocalUC _exerciseLocalUC;
  final ExerciseApiUC _exerciseApiUC;
  goToWorkoutDetail(Exercise exercise) {
    Get.toNamed(AppRoutes.workoutDetail, arguments: exercise);
  }

  Future<List<Exercise>> fetchExercises() async {
    var exercises = <Exercise>[].obs;
    final data = await _exerciseApiUC.execute();

    return exercises;
  }

  /// History Page Controller
  final RxList<dynamic> historyData = [].obs;
  Future<List<dynamic>> fetchHistory() async {
    List<dynamic> data = await InternetService().fetchHistory();
    historyData.value = data;
    return data;
  }

  String formattedDateHistory(String date) {
    return DateUtils.monthToWord(date);
  }

  /// Setting Page Controller
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
