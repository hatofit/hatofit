import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Workout {
  final String name;
  final String date;
  final String duration;
  final int averageHR;
  final int calories;
  final IconData icon;

  Workout({
    required this.name,
    required this.date,
    required this.duration,
    required this.averageHR,
    required this.calories,
    required this.icon,
  });
}

class HistoryController extends GetxController {
  final String title = 'History';
  RxList<Workout> workouts = <Workout>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchWorkoutHistory();
  }

  void fetchWorkoutHistory() {
    Future.delayed(const Duration(seconds: 1), () {
      workouts.assignAll([
        Workout(
          averageHR: 999,
          calories: 10000,
          date: '2023-05-26',
          duration: '01:41:00',
          name: 'Running',
          icon: FontAwesomeIcons.personRunning,
        ),
        Workout(
          averageHR: 999,
          calories: 99998,
          date: '2023-05-26',
          duration: '01:41:00',
          name: 'Swimming',
          icon: FontAwesomeIcons.personSwimming,
        ),
        Workout(
          averageHR: 999,
          calories: 1234,
          date: '2023-05-26',
          duration: '01:41:00',
          name: 'Volley',
          icon: FontAwesomeIcons.volleyball,
        ),
      ]);
    });
  }
}
