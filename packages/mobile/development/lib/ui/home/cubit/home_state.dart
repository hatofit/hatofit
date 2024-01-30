part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(SuccessResponse success) = _Success;
  const factory HomeState.failure(String message) = _Failure;
  const factory HomeState.empty() = _Empty;
}

class SuccessResponse {
  List<HrBarChartItem> hrData;
  double calories;
  double bmi;
  String bmiStatus;
  String userName;

  SuccessResponse({
    required this.hrData,
    required this.calories,
    required this.bmi,
    required this.bmiStatus,
    required this.userName,
  });
}

class HrBarChartItem {
  final DateTime date;
  final double avgHr;
  HrBarChartItem(this.date, this.avgHr);
}
