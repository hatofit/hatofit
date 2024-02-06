import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:intl/intl.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetReportsUsecase _getReportsUsecase;
  final GetUserUsecase _getUserUsecase;
  final DownloadImageUsecase _downloadImageUsecase;
  final GetStringFirebaseUsecase _getStringFirebaseUsecase;
  HomeCubit(
    this._getReportsUsecase,
    this._getUserUsecase,
    this._downloadImageUsecase,
    this._getStringFirebaseUsecase,
  ) : super(_HomeState());

  String userName = "User";
  Future<void> init() async {
    await getUser();
    await heroImage();
    await getData();
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
    final res = await _getUserUsecase.call();
    res.fold((l) => null, (r) {
      userName = r.firstName ?? "User";
      emit(state.copyWith(user: r));
    });
  }

  Future<void> getReport() async {
    final res = await _getReportsUsecase.call(const GetReportsParams(
      page: 0,
      limit: 1,
    ));
    res.fold((l) => null, (r) {
      emit(state.copyWith(
        hrData: [],
        calories: 0,
      ));
    });
  }

  Future<void> getData() async {
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
