part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<HrBarChartItem> hrData,
    @Default(0) double calories,
    @Default(0) double bmi,
    UserEntity? user,
    String? heroUrl,
    String? dateNow,
  }) = _HomeState;
}

class HrBarChartItem {
  final DateTime date;
  final double avgHr;
  HrBarChartItem(this.date, this.avgHr);
}
