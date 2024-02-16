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
  final GetBoolFirebaseUsecase _getBoolFirebaseUsecase;
  final SessionDeleteAllUsecase _sessionDeleteAllUsecase;

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
    this._getBoolFirebaseUsecase,
    this._sessionDeleteAllUsecase,
  ) : super(DataHelper(type: "en", activeTheme: ActiveTheme.system));

  final List<DataHelper> listLanguage = [
    DataHelper(
        title: Constants.get.english,
        type: "en",
        iconPath: 'assets/images/icons/united-kingdom.png'),
    DataHelper(
        title: Constants.get.bahasa,
        type: "id",
        iconPath: 'assets/images/icons/indonesia.png'),
  ];
  final List<DataHelper> listEnergyUnit = [
    DataHelper(
      title: Constants.get.kilocalorie,
      type: "kcal",
    ),
    DataHelper(
      title: Constants.get.kilojoule,
      type: "kj",
    ),
  ];
  final List<DataHelper> listHeightUnit = [
    DataHelper(
      title: Constants.get.centimeter,
      type: "cm",
    ),
    DataHelper(
      title: Constants.get.inch,
      type: "in",
    ),
  ];
  final List<DataHelper> listWeightUnit = [
    DataHelper(
      title: Constants.get.kilogram,
      type: "kg",
    ),
    DataHelper(
      title: Constants.get.pound,
      type: "lb",
    ),
  ];

  void init() async {
    await fetchUser();
    await fetchFRC();
    await fetchLang();
    await readActiveTheme();
  }

  Future<void> fetchUser() async {
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: true));
    res.fold((l) {}, (r) {
      safeEmit(state.copyWith(user: r), emit: emit, isClosed: isClosed);
    });
  }

  Future<void> fetchFRC() async {
    final res = await _getBoolFirebaseUsecase
        .call(FirebaseConstant.get.isGoogleFitAvailable);
    res.fold((l) {}, (r) {
      safeEmit(
        state.copyWith(isGoogleFitAvailable: r),
        emit: emit,
        isClosed: isClosed,
      );
    });
  }

  Future<void> fetchLang() async {
    final res = await _getLanguageUsecase.call();
    res.fold((l) => emit(state.copyWith(sLang: listLanguage[0])), (r) {
      final lang = listLanguage.firstWhere((e) => e.type == r);
      emit(state.copyWith(sLang: lang));
    });
  }

  String determineUsername(String? name, bool emptyWhenNull) {
    if (name == null) {
      return 'User';
    } else {
      if (name.isNotEmpty) {
        if (name.length > 8) {
          return "${name.substring(0, 8)}...";
        } else {
          return name;
        }
      } else if (emptyWhenNull) {
        return "";
      } else {
        return "User";
      }
    }
  }

  int getAge(DateTime? dob) {
    if (dob == null) return 0;
    final now = DateTime.now();
    return now.year - dob.year;
  }

  Future<void> updateTheme(ActiveTheme activeTheme) async {
    String? lang;
    _getLanguageUsecase
        .call()
        .then((value) => lang = value.getOrElse(() => "en"));
    safeEmit(
      state.copyWith(activeTheme: activeTheme, type: lang ?? "en"),
      emit: emit,
      isClosed: isClosed,
    );
    _updateActiveThemeUsecase.call(activeTheme).then((_) => null);
  }

  void updateLanguage(String lang) {
    ActiveTheme? theme;
    readActiveTheme().then((v) => theme = v);
    safeEmit(
      state.copyWith(type: lang, activeTheme: theme ?? ActiveTheme.system),
      emit: emit,
      isClosed: isClosed,
    );
    _upesertLanguageUsecase.call(lang).then((_) => null);
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
        state.copyWith(
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
    await _sessionDeleteAllUsecase.call();
  }

  Future<void> updateGender(String gender) async {
    emit(state.copyWith(user: state.user?.copyWith(gender: gender)));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase
          .call(RegisterParams.fromUser(user).copyWith(gender: gender));
    }
  }

  Future<void> updateHeight(int height) async {
    emit(state.copyWith(user: state.user?.copyWith(height: height)));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase
          .call(RegisterParams.fromUser(user).copyWith(height: height));
    }
  }

  Future<void> updateWeight(int weight) async {
    emit(state.copyWith(user: state.user?.copyWith(weight: weight)));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase
          .call(RegisterParams.fromUser(user).copyWith(weight: weight));
    }
  }

  Future<void> updateDateOfBirth(DateTime dateOfBirth) async {
    emit(state.copyWith(user: state.user?.copyWith(dateOfBirth: dateOfBirth)));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase.call(RegisterParams.fromUser(user)
          .copyWith(dateOfBirth: dateOfBirth.toString()));
    }
  }

  Future<void> uEUnit(String val) async {
    final u = state.user;
    emit(state.copyWith(
        user: u?.copyWith(
            metricUnits: u.metricUnits?.copyWith(energyUnits: val))));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase.call(RegisterParams.fromUser(user));
    }
  }

  Future<void> uHUnit(String val) async {
    final u = state.user;
    emit(state.copyWith(
        user: u?.copyWith(
            metricUnits: u.metricUnits?.copyWith(heightUnits: val))));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase.call(RegisterParams.fromUser(user));
    }
  }

  Future<void> uWUnit(String val) async {
    final u = state.user;
    emit(state.copyWith(
        user: u?.copyWith(
            metricUnits: u.metricUnits?.copyWith(weightUnits: val))));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase.call(RegisterParams.fromUser(user));
    }
  }
}
