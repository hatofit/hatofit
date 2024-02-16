import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/ext/ext.dart';
import 'package:hatofit/utils/helper/logger.dart';
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
    await getUser();
    await heroImage();
    getData();
    await getSession();
  }

  Future<void> heroImage() async {
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

  Future<void> getUser() async {
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: false));
    res.fold((l) => null, (r) {
      emit(state.copyWith(user: r));
    });
  }

  Future<void> getSession() async {
    final res = await _getSessionsUsecase.call(const ByLimitParams(limit: 5));
    res.fold((l) => log.e("Report: $l"), (r) async {
      List<HrBarChartItem> reports = [];
      final nDate = formatter.format(DateTime.now());
      for (final i in r) {
        final sTime = DateTime.fromMicrosecondsSinceEpoch(i.startTime!);
        final sDate = formatter.format(sTime);
        if (sDate == nDate) {
          final report = await i.generateHrData();
          if (report != null) {
            reports.add(report);
          }
        }
      }
      emit(state.copyWith(
        hrData: reports,
      ));
    });
  }

  void getData() {
    final user = state.user;
    if (user == null) return;
    final bmi = getBmi(user);
    emit(state.copyWith(
      bmi: bmi,
      dateNow: formatter.format(DateTime.now()),
    ));
  }

  final formatter = DateFormat('d MMMM yyyy');

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
