import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SessionAllUsecase _getSessionsUsecase;
  final ReadUserUsecase _readUserUsecase;
  final DownloadImageUsecase _downloadImageUsecase;
  final GetStringFirebaseUsecase _getStringFirebaseUsecase;
  HomeCubit(
    this._getSessionsUsecase,
    this._readUserUsecase,
    this._downloadImageUsecase,
    this._getStringFirebaseUsecase,
  ) : super(_HomeState());

  Future<void> init() async {
    await _getUser();
    await _heroImage();
    _getData();
    await _getSession();
  }

  Future<void> _heroImage() async {
    final getUrl =
        await _getStringFirebaseUsecase.call(FirebaseConstant.get.homeHeroKey);

    return getUrl.fold(
      (l) => null,
      (r) async {
        emit(state.copyWith(heroUrl: r));
        await _downloadImageUsecase
            .call(DownloadImageParams(url: r, fileName: "home-hero.png"));
      },
    );
  }

  Future<void> _getUser() async {
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: false));
    res.fold((l) => null, (r) {
      emit(state.copyWith(user: r));
    });
  }

  Future<void> _getSession() async {
    final res = await _getSessionsUsecase.call(const ByLimitParams(limit: 5));
    res.fold((l) => null, (r) async {
      List<HrBarChartItem> reports = [];
      int calories = 0;
      final nDate = formatter.format(DateTime.now());
      for (final i in r) {
        final sTime = DateTime.fromMicrosecondsSinceEpoch(i.startTime!);
        final sDate = formatter.format(sTime);
        if (sDate == nDate) {
          final report = await i.generateHrData(state.user);
          if (report != null) {
            reports.add(report.value1);
            calories += report.value2;
            emit(state.copyWith(
              hrData: reports.take(5).toList(),
              calories: calories.toDouble(),
            ));
          }
        }
      }
    });
  }

  void _getData() {
    final user = state.user;
    if (user == null) return;
    final bmi = _getBmi(user);
    emit(state.copyWith(
      bmi: bmi,
      dateNow: formatter.format(DateTime.now()),
    ));
  }

  final formatter = DateFormat('d MMMM yyyy');

  double _getBmi(UserEntity user) {
    final height = user.height ?? 0;
    final weight = user.weight ?? 0;
    final metricUnits = user.metricUnits;

    if (metricUnits == null) return 0;

    double bmi = 0;
    double hInM;

    switch (metricUnits.heightUnits) {
      case 'cm':
        hInM = height / 100;
        break;
      case 'in':
        hInM = height * 0.0254;
        break;
      default:
        return 0;
    }

    switch (metricUnits.weightUnits) {
      case 'kg':
        bmi = weight / (hInM * hInM);
        break;
      case 'lb':
        bmi = weight / (hInM * hInM) * 703;
        break;
      default:
        return 0;
    }

    return double.parse(bmi.toStringAsFixed(1));
  }
}
