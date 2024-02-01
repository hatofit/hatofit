import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:intl/intl.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetReportsUsecase _getReportsUsecase;
  final GetSessionUsecase _getSessionsUsecase;
  final GetUserUsecase _getUserUsecase;
  HomeCubit(
    this._getReportsUsecase,
    this._getUserUsecase,
    this._getSessionsUsecase,
  ) : super(const _Loading());

  String userName = "User";
  Future<void> init() async {
    await getData();
  }

  Future<void> getData() async {
    emit(const _Loading());
    final res = await _getReportsUsecase.call(const GetReportsParams(
      page: 0,
      limit: 1,
    ));

    res.fold(
      (failure) {
        if (failure is CacheFailure) {
          emit(_Failure(failure.reason ?? "Cache Failure"));
        }
      },
      (session) async {
        final user = await getUser();
        if (user == null) return emit(const _Failure("User not found"));
        userName = user.firstName ?? "User";
        final bmi = getBmi(user);
        final bmiStatus = getBmiStatus(bmi);
        emit(_Success(SuccessResponse(
          hrData: [],
          calories: 0,
          bmi: bmi,
          bmiStatus: bmiStatus,
          userName: userName,
        )));
      },
    );
  }

  Future<UserEntity?> getUser() async {
    final res = await _getUserUsecase.call();
    return res.fold(
      (l) => null,
      (r) => r,
    );
  }

  final formatter = DateFormat('d MMMM yyyy');
  // List<HrBarChartItem> hrToReport(List<ReportEntity> reports) {
  //   if (reports.isEmpty) return [];

  // }

  String getBmiStatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }

  double getBmi(UserEntity user) {
    final height = user.height ?? 0;
    final weight = user.weight ?? 0;
    final metricUnits = user.metricUnits;
    if (metricUnits == null) return 0;

    double? bmi;
    switch (metricUnits.weightUnits) {
      case 'kg':
        switch (metricUnits.heightUnits) {
          case 'cm':
            bmi = weight / ((height / 100) * (height / 100));
            break;
          case 'ft':
            bmi = weight / ((height * 12) * (height * 12)) * 703;
            break;
        }
        break;

      case 'lbs':
        switch (metricUnits.heightUnits) {
          case 'cm':
            bmi = weight / ((height / 100) * (height / 100)) * 703;
            break;
          case 'ft':
            bmi = weight / ((height * 12) * (height * 12));
            break;
        }
        break;
    }

    return double.parse(bmi!.toStringAsFixed(1));
  }
}
