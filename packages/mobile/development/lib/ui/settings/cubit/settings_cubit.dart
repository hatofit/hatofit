import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

class SettingsCubit extends Cubit<DataHelper> {
  final ReadActiveThemeUsecase _readActiveThemeUsecase;
  final UpdateActiveThemeUsecase _updateActiveThemeUsecase;
  final ReadLanguageUsecase _getLanguageUsecase;
  final UpesertLanguageUsecase _upesertLanguageUsecase;
  final ReadUserUsecase _readUserUsecase;
  final UpsertUserUsecase _upsertUserUsecase;
  final DeleteMoodUsecase _deleteMoodUsecase;
  final DeleteTokenUsecase _deleteTokenUsecase;
  final DeleteUserUsecase _deleteUserUsecase;
  SettingsCubit(
    this._readActiveThemeUsecase,
    this._updateActiveThemeUsecase,
    this._getLanguageUsecase,
    this._upesertLanguageUsecase,
    this._readUserUsecase,
    this._upsertUserUsecase,
    this._deleteMoodUsecase,
    this._deleteTokenUsecase,
    this._deleteUserUsecase,
  ) : super(DataHelper(type: "en", activeTheme: ActiveTheme.system));

  Future<void> updateTheme(ActiveTheme activeTheme) async {
    await _updateActiveThemeUsecase.call(activeTheme);
    final res = await _getLanguageUsecase.call();
    res.fold((l) => null, (r) {
      safeEmit(
        DataHelper(
          activeTheme: activeTheme,
          type: r,
        ),
        emit: emit,
        isClosed: isClosed,
      );
    });
  }

  Future<void> updateLanguage(String type) async {
    await _upesertLanguageUsecase.call(type);
    safeEmit(
      DataHelper(
        type: type,
        activeTheme: await readActiveTheme(),
      ),
      emit: emit,
      isClosed: isClosed,
    );
  }

  Future<void> updateAll(
    ActiveTheme theme,
    String locale,
    String heightUnit,
    String weightUnit,
    String energyUnit,
  ) async {
    _updateActiveThemeUsecase.call(theme);
    _upesertLanguageUsecase.call(locale);
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: false));
    res.fold((l) => null, (r) {
      _upsertUserUsecase.call(RegisterParams(
        firstName: r.firstName ?? "",
        lastName: r.lastName ?? "",
        gender: r.gender ?? "",
        email: r.email ?? "",
        dateOfBirth: r.dateOfBirth.toString(),
        photo: File(r.photo ?? ""),
        weight: r.weight ?? 125,
        height: r.height ?? 150,
        metricUnits: {
          "energyUnits": r.metricUnits?.energyUnits ?? "kcal",
          "heightUnits": r.metricUnits?.heightUnits ?? "cm",
          "weightUnits": r.metricUnits?.weightUnits ?? "kg",
        },
      ));
    });
  }

  Future<ActiveTheme> readActiveTheme() async {
    final res = await _readActiveThemeUsecase.call();
    return res.fold((l) async {
      await _updateActiveThemeUsecase.call(ActiveTheme.system);
      return ActiveTheme.system;
    }, (r) async {
      final activeTheme = ActiveTheme.values.singleWhere(
        (element) => element.name == r.name,
      );
      safeEmit(
        DataHelper(
          activeTheme: activeTheme,
          type: (await _getLanguageUsecase.call()).getOrElse(() => "en"),
        ),
        emit: emit,
        isClosed: isClosed,
      );
      return activeTheme;
    });
  }

  Future<void> logout() async {
    await _deleteMoodUsecase.call();
    await _deleteTokenUsecase.call();
    await _deleteUserUsecase.call();
  }
}
