import 'dart:async';

import 'package:dartz/dartz.dart';
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
  final ExerciseAllUsecase _exercisesAllUsecase;
  final ReadUserUsecase _readUserUsecase;
  final CreateSessionUsecase _createSessionUsecase;
  WorkoutCubit(
    this._exercisesAllUsecase,
    this._readUserUsecase,
    this._createSessionUsecase,
  ) : super(const _Loading());

  Future<void> init() async {
    await getExercises();
    await getUser();
  }

  UserEntity? user;
  Future<void> getUser() async {
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: true));
    res.fold(
      (l) {
        user = null;
      },
      (r) => user = r,
    );
  }

  Future<void> getExercises() async {
    emit(const _Loading());
    final res = await _exercisesAllUsecase.call(const ByLimitParams(
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
        calories: 0,
        avgHr: 0,
        hrSamples: [],
        accSamples: [],
        ecgSamples: [],
        gyroSamples: [],
        magnetometerSamples: [],
        ppgSamples: [],
        hrChart: [],
        hrPecentage: 0,
      );
      isParserDone = true;
      return false;
    } else {
      return true;
    }
  }

  Future<bool> finishWorkout() async {
    await close();
    return isClosed;
  }

  Future<bool> endWorkout({
    required bool isFreeWorkout,
    required WorkoutSession session,
    required UserEntity? user,
    required BleEntity ble,
    required String mood,
    ExerciseEntity? exercise,
  }) async {
    log.f("Finish workout");
    if (user != null && exercise != null) {
      final params = await session.createParams(user, exercise, mood, ble);
      log.f(params);
      final res = await _createSessionUsecase.call(params);
      return res.fold(
        (l) {
          log.i("WorkoutSession failed to create");
          log.i(l);
          return false;
        },
        (r) {
          log.i("WorkoutSession created");
          log.i(r);
          ses = WorkoutSession(
            calories: 0,
            avgHr: 0,
            hrSamples: [],
            accSamples: [],
            ecgSamples: [],
            gyroSamples: [],
            magnetometerSamples: [],
            ppgSamples: [],
            hrChart: [],
            hrPecentage: 0,
          );
          isParserDone = true;
          return true;
        },
      );
    } else {
      return false;
    }
  }

  WorkoutSession ses = WorkoutSession(
    calories: 0,
    avgHr: 0,
    hrSamples: [],
    accSamples: [],
    ecgSamples: [],
    gyroSamples: [],
    magnetometerSamples: [],
    ppgSamples: [],
    hrChart: [],
    hrPecentage: 0,
  );
  bool isParserDone = true;
  Future<void> receiveStreamData({
    PolarHrSample? hr,
    UserEntity? user,
    List<PolarEcgSample>? ecg,
    PolarAccSample? acc,
    PolarGyroSample? gyro,
    PolarMagnetometerSample? magnetometer,
    PolarPpgSample? ppg,
    required int second,
    required DateTime timeStamp,
  }) async {
    if (user != null) {
      ses.user = user;
    } else {
      return;
    }
    if (hr != null) {
      ses.hrSamples?.add(HrSample(
        timeStamp: timeStamp,
        second: second,
        hr: hr.hr,
        rrsMs: hr.rrsMs,
        contactStatus: hr.contactStatus,
        contactStatusSupported: hr.contactStatusSupported,
      ));

      if (isParserDone == true) {
        isParserDone = false;
        final parser = ModelToEntityIsolateParser(ses, (res) {
          final WorkoutSession s = res as WorkoutSession;
          final hr = s.hrSamples;
          final hrLength = hr?.length ?? 0;
          double avgHr = 0;
          int maxHr = 0;
          int minHr = 220;
          int lastHr = 0;
          double calories = s.calories;
          DateTime hookTime1 = DateTime.now();
          DateTime hookTime2 = DateTime.now();
          List<WSessionChart> hrChart = [];
          for (var i = 0; i < (hrLength); i++) {
            avgHr += hr![i].hr;
            if (hr[i].hr > maxHr) {
              maxHr = hr[i].hr;
            }
            if (hr[i].hr < minHr) {
              minHr = hr[i].hr;
            }
            if (i == 0) {
              hookTime1 = hr[i].timeStamp;
            }
            if (i == hrLength - 1) {
              hookTime2 = hr[i].timeStamp;
              lastHr = hr[i].hr;
            }
            if (i > hrLength - 30) {
              hrChart.add(WSessionChart(hr[i].timeStamp, hr[i].hr));
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
          final usrMaxHr = 208 - (0.7 * age);
          final hrPecentage = ((lastHr / usrMaxHr) * 100).round();
          // final hrPecentage = 90;
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
            avgHr: avgHr,
            maxHr: maxHr,
            minHr: minHr,
            calories: calories,
            duration: duration,
            hrChart: hrChart,
            hrPecentage: hrPecentage,
            hrZoneType: hrZoneType,
          );
        });
        final res = await parser.parseInBackground();
        if (res.duration != null) {
          ses = ses.copyWith(
            avgHr: res.avgHr,
            maxHr: res.maxHr,
            minHr: res.minHr,
            calories: res.calories,
            duration: res.duration,
            hrChart: res.hrChart,
            hrPecentage: res.hrPecentage,
            hrZoneType: res.hrZoneType,
          );
          isParserDone = true;
        }
      }
    }
    if (ecg != null) {
      for (final e in ecg) {
        ses.ecgSamples?.add(
          EcgSample(
            timeStamp: e.timeStamp,
            second: second,
            voltage: e.voltage,
          ),
        );
      }
    }

    if (acc != null) {
      ses.accSamples?.add(
        AccSample(
          timeStamp: timeStamp,
          second: second,
          x: acc.x,
          y: acc.y,
          z: acc.z,
        ),
      );
    }
    if (gyro != null) {
      ses.gyroSamples?.add(
        GyroSample(
          timeStamp: timeStamp,
          second: second,
          x: gyro.x,
          y: gyro.y,
          z: gyro.z,
        ),
      );
    }
    if (magnetometer != null) {
      ses.magnetometerSamples?.add(
        MagnetometerSample(
          timeStamp: timeStamp,
          second: second,
          x: magnetometer.x,
          y: magnetometer.y,
          z: magnetometer.z,
        ),
      );
    }
    if (ppg != null) {
      ses.ppgSamples?.add(
        PpgSample(
          timeStamp: timeStamp,
          second: second,
          channelSamples: ppg.channelSamples,
        ),
      );
    }
  }
}
