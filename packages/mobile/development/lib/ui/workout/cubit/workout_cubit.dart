import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/helper/logger.dart';
import 'package:polar/polar.dart';

part 'workout_cubit.freezed.dart';
part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final GetExercisesUsecase _getExercisesUsecase;
  final GetUserUsecase _getUserUsecase;
  WorkoutCubit(
    this._getExercisesUsecase,
    this._getUserUsecase,
  ) : super(const _Loading());

  Future<void> init() async {
    await getExercises();
    await getUser();
  }

  UserEntity? user;
  Future<void> getUser() async {
    final res = await _getUserUsecase.call(GetUserParams(fromLocal: true));
    res.fold(
      (l) {
        user = null;
      },
      (r) => user = r,
    );
  }

  Future<void> getExercises() async {
    emit(const _Loading());
    final res = await _getExercisesUsecase.call(const GetExercisesParams(
      showFromCompany: true,
    ));
    res.fold(
      (l) {
        emit(_Failure(l));
      },
      (r) => emit(_Success(r)),
    );
  }

  bool startWorkout(bool isFreeWorkout, ExerciseEntity? exercise) {
    if (user == null) {
      ses = WorkoutSession(
          calories: 0, avgHr: 0, hrSamples: [], hrChart: [], hrPecentage: 0);
      isParserDone = true;
      return false;
    } else {
      emit(_Start(freeTraining: isFreeWorkout, exercise: exercise, user: user));
      return true;
    }
  }

  void finishWorkout(
      bool isFreeWorkout, ExerciseEntity? exercise, SessionEntity session) {
    emit(_Finish(
        freeTraining: isFreeWorkout, exercise: exercise, session: session));
  }

  WorkoutSession ses = WorkoutSession(
      calories: 0, avgHr: 0, hrSamples: [], hrChart: [], hrPecentage: 0);
  bool isParserDone = true;
  Future<void> receiveStreamData(HrSample? hr, UserEntity? user) async {
    if (user != null) {
      ses.user = user;
    } else {
      return;
    }
    log.i('user: ${ses.user!.metricUnits}');
    if (hr != null) {
      ses.hrSamples.add(hr);

      if (isParserDone == true) {
        isParserDone = false;
        final parser = ModelToEntityIsolateParser(ses, (res) {
          final WorkoutSession s = res as WorkoutSession;
          final hr = s.hrSamples;
          final hrLength = hr.length;
          double avgHr = 0;
          int maxHr = 0;
          int minHr = 220;
          double calories = s.calories;
          DateTime hookTime1 = DateTime.now();
          DateTime hookTime2 = DateTime.now();
          List<WSessionChart> hrChart = [];
          for (var i = 0; i < hrLength; i++) {
            avgHr += hr[i].hr;
            if (hr[i].hr > maxHr) {
              maxHr = hr[i].hr;
            }
            if (hr[i].hr < minHr) {
              minHr = hr[i].hr;
            }
            if (i == 0) {
              hookTime1 = hr[i].timestamp;
            }
            if (i == hrLength - 1) {
              hookTime2 = hr[i].timestamp;
            }
            if (i > hrLength - 30) {
              hrChart.add(WSessionChart(hr[i].timestamp, hr[i].hr));
            }
          }
          final duration = hookTime2.difference(hookTime1);
          avgHr = avgHr / hrLength;
          final age = hookTime1.year - s.user!.dateOfBirth!.year;
          if (duration.inSeconds % 30 == 0) {
            final weight = s.user!.weight ?? 125;
            final gender = s.user!.gender ?? "male";
            final wUnit = s.user!.metricUnits!.weightUnits ?? "kg";
            final eUnit = s.user!.metricUnits!.energyUnits ?? "kcal";

            switch (gender) {
              case 'male':
                if (wUnit == 'kg') {
                  calories = duration.inSeconds *
                      (0.6309 * avgHr +
                          0.1988 * weight +
                          0.2017 * age -
                          55.0969) /
                      4.184 /
                      60;
                } else if (wUnit == 'lbs') {
                  final weightInKg = weight * 0.453592;
                  calories = duration.inSeconds *
                      (0.6309 * avgHr +
                          0.1988 * weightInKg +
                          0.2017 * age -
                          55.0969) /
                      4.184 /
                      60;
                }
                break;
              case 'female':
                if (wUnit == 'kg') {
                  calories = duration.inSeconds *
                      (0.4472 * avgHr -
                          0.1263 * weight +
                          0.074 * age -
                          20.4022) /
                      4.184 /
                      60;
                } else if (wUnit == 'lbs') {
                  final weightInKg = weight * 0.453592;
                  calories = duration.inSeconds *
                      (0.4472 * avgHr -
                          0.1263 * weightInKg +
                          0.074 * age -
                          20.4022) /
                      4.184 /
                      60;
                }
                break;
              default:
                calories = 0;
            }
            if (eUnit == 'kcal') {
              calories = calories;
            } else if (eUnit == 'kJ') {
              calories = calories * 4.184;
            }
          }
          final hrPecentage = (avgHr / 220 * 100).toInt();
          HrZoneType hrZoneType = HrZoneType.MODERATE;
          if (hrPecentage < 50) {
            hrZoneType = HrZoneType.VERYLIGHT;
          } else if (hrPecentage < 60) {
            hrZoneType = HrZoneType.LIGHT;
          } else if (hrPecentage < 70) {
            hrZoneType = HrZoneType.MODERATE;
          } else if (hrPecentage < 80) {
            hrZoneType = HrZoneType.HARD;
          } else {
            hrZoneType = HrZoneType.MAXIMUM;
          }
          return WorkoutSession(
            hrSamples: hr,
            avgHr: avgHr,
            maxHr: maxHr,
            minHr: minHr,
            calories: calories,
            duration: duration,
            hrChart: hrChart,
            user: s.user,
            hrPecentage: hrPecentage,
            hrZoneType: hrZoneType,
          );
        });
        final res = await parser.parseInBackground();
        if (res.duration != null) {
          ses = res;
          isParserDone = true;
        }
      }
    }
  }
}
