import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/services/services.dart';
import 'package:polar/polar.dart';

part 'workout_cubit.freezed.dart';
part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> with VibratorMixin {
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

  bool isStarted = false;
  bool startWorkout(bool isFreeWorkout, ExerciseEntity? exercise) {
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
    isStarted = true;
    vibrateTwice();
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> endWorkout({
    required bool isFreeWorkout,
    required WorkoutSession session,
    required UserEntity? user,
    required BleEntity ble,
    required String mood,
    ExerciseEntity? exercise,
  }) async {
    isStarted = false;
    if (user != null && exercise != null) {
      final params = await session.createParams(user, exercise, mood, ble);
      final res = await _createSessionUsecase.call(params);
      return res.fold(
        (l) {
          return false;
        },
        (r) {
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
  bool isAlreadyVibrating = false;

  Future<void> receiveStreamData({
    PolarHrSample? hr,
    UserEntity? user,
    List<PolarEcgSample>? ecg,
    PolarAccSample? acc,
    PolarGyroSample? gyro,
    PolarMagnetometerSample? magnetometer,
    PolarPpgSample? ppg,
    required Duration duration,
    required int second,
    required DateTime timeStamp,
    required int year,
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
        final parser = IParser(ses, (res) {
          final WorkoutSession s = res as WorkoutSession;
          final hr = s.hrSamples;
          final hrLength = hr?.length ?? 0;
          double avgHr = 0;
          int maxHr = 0;
          int minHr = 220;
          double calories = s.calories;
          // List<WSessionChart> hrChart = [];
          for (var i = 0; i < (hrLength); i++) {
            avgHr += hr![i].hr;
            if (hr[i].hr > maxHr) {
              maxHr = hr[i].hr;
            }
            if (hr[i].hr < minHr) {
              minHr = hr[i].hr;
            }
            // if (i > hrLength - 30) {
            //   hrChart.add(WSessionChart(hr[i].timeStamp, hr[i].hr));
            // }
          }
          avgHr = avgHr / hrLength;
          final age = year - s.user!.dateOfBirth!.year;
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
          final hrPecentage = ((avgHr / (208 - (0.7 * age))) * 100).round();
          // final hrPecentage = 90;
          HrZoneType hrZoneType = HrZoneType.moderate;
          if (hrPecentage < 50) {
            hrZoneType = HrZoneType.veryLight;
          } else if (hrPecentage < 60) {
            hrZoneType = HrZoneType.light;
          } else if (hrPecentage < 70) {
            hrZoneType = HrZoneType.moderate;
          } else if (hrPecentage < 80) {
            hrZoneType = HrZoneType.hard;
          } else {
            hrZoneType = HrZoneType.max;
          }
          return WorkoutSession(
            avgHr: avgHr,
            maxHr: maxHr,
            minHr: minHr,
            calories: calories,
            // hrChart: hrChart,
            hrPecentage: hrPecentage,
            hrZoneType: hrZoneType,
          );
        });
        final res = await parser.parseInBackground();
        ses = ses.copyWith(
          avgHr: res.avgHr,
          maxHr: res.maxHr,
          minHr: res.minHr,
          calories: res.calories,
          // hrChart: res.hrChart,
          hrPecentage: res.hrPecentage,
          hrZoneType: res.hrZoneType,
        );
        if (ses.hrChart == null) {
          ses.hrChart = [];
          ses.hrChart?.add(WSessionChart(timeStamp, hr.hr));
        } else {
          if (ses.hrChart!.length < 30) {
            ses.hrChart?.add(WSessionChart(timeStamp, hr.hr));
          } else {
            ses.hrChart?.removeAt(0);
            ses.hrChart?.add(WSessionChart(timeStamp, hr.hr));
          }
        }
        isParserDone = true;
        if (res.hrZoneType == HrZoneType.max && !isAlreadyVibrating) {
          isAlreadyVibrating = true;
          vibrateTwice();
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
