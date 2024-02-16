import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/constant/constant.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

part 'intro_cubit.freezed.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final ReadUserUsecase _readUserUsecase;
  final UpsertUserUsecase _upsertUserUsecase;
  final GetOfflineModeUsecase _getOfflineModeUsecase;
  final ReadLanguageUsecase _getLanguageUsecase;
  IntroCubit(
    this._readUserUsecase,
    this._upsertUserUsecase,
    this._getOfflineModeUsecase,
    this._getLanguageUsecase,
  ) : super(IntroState());

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
  Future<void> init() async {
    await fetchUser();
    await fetchLang();
    fetchEnergyUnit();
    fetchHeightUnit();
    fetchWeightUnit();
  }

  Future<void> fetchUser() async {
    final res =
        await _readUserUsecase.call(const ByLimitParams(showFromLocal: false));
    res.fold(
        (l) => emit(IntroState(
            user: UserEntity(
                metricUnits: const UserMetricUnitsEntity(
                  energyUnits: "kcal",
                  heightUnits: "cm",
                  weightUnits: "kg",
                ),
                dateOfBirth: DateTime.now(),
                height: 150,
                weight: 125,
                gender: "male"))), (r) {
      emit(IntroState(
        user: r,
      ));
    });
  }

  Future<void> fetchLang() async {
    final res = await _getLanguageUsecase.call();
    res.fold((l) => emit(state.copyWith(sLang: listLanguage[0])), (r) {
      final lang = listLanguage.firstWhere((e) => e.type == r);
      emit(state.copyWith(sLang: lang));
    });
  }

  void fetchEnergyUnit() {
    final user = state.user;
    if (user != null) {
      final sEUnit = listEnergyUnit.firstWhere(
        (e) => e.type == user.metricUnits?.energyUnits,
      );
      emit(state.copyWith(sEUnit: sEUnit));
    } else {
      emit(state.copyWith(sEUnit: listEnergyUnit[0]));
    }
  }

  void fetchHeightUnit() {
    final user = state.user;
    if (user != null) {
      final sHUnit = listHeightUnit.firstWhere(
        (e) => e.type == user.metricUnits?.heightUnits,
      );
      emit(state.copyWith(sHUnit: sHUnit));
    } else {
      emit(state.copyWith(sHUnit: listHeightUnit[0]));
    }
  }

  void fetchWeightUnit() {
    final user = state.user;
    if (user != null) {
      final sWUnit = listWeightUnit.firstWhere(
        (e) => e.type == user.metricUnits?.weightUnits,
      );
      emit(state.copyWith(sWUnit: sWUnit));
    } else {
      emit(state.copyWith(sWUnit: listWeightUnit[0]));
    }
  }

  Future<void> uEUnit(String val) async {
    emit(state.copyWith(
        user: state.user
            ?.copyWith(metricUnits: UserMetricUnitsEntity(energyUnits: val))));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase
          .call(RegisterParams.fromUser(user).copyWith(metricUnits: {
        "energyUnits": val,
        "heightUnits": user.metricUnits?.heightUnits ?? "cm",
        "weightUnits": user.metricUnits?.weightUnits ?? "kg",
      }));
    }
  }

  Future<void> uHUnit(String val) async {
    emit(state.copyWith(
        user: state.user
            ?.copyWith(metricUnits: UserMetricUnitsEntity(heightUnits: val))));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase
          .call(RegisterParams.fromUser(user).copyWith(metricUnits: {
        "energyUnits": user.metricUnits?.energyUnits ?? "kcal",
        "heightUnits": val,
        "weightUnits": user.metricUnits?.weightUnits ?? "kg",
      }));
    }
  }

  Future<void> uWUnit(String val) async {
    emit(state.copyWith(
        user: state.user
            ?.copyWith(metricUnits: UserMetricUnitsEntity(weightUnits: val))));
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase
          .call(RegisterParams.fromUser(user).copyWith(metricUnits: {
        "energyUnits": user.metricUnits?.energyUnits ?? "kcal",
        "heightUnits": user.metricUnits?.heightUnits ?? "cm",
        "weightUnits": val,
      }));
    }
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

  Future<void> updateAll() async {
    final user = state.user;
    if (user != null) {
      await _upsertUserUsecase.call(RegisterParams.fromUser(user));
    }
  }

  Future<DataHelper> selectedLanguage(List<DataHelper> langs) async {
    final res = await _getLanguageUsecase.call();
    return res.fold((l) => langs.first, (r) {
      return langs.firstWhere((e) => e.type == r);
    });
  }

  Future<DataHelper> selectedEnergyUnit(List<DataHelper> units) async {
    final user = state.user;
    if (user != null) {
      return units.firstWhere(
        (e) => e.type! == user.metricUnits?.energyUnits,
      );
    }
    return units.first;
  }

  Future<bool> isOfflineMode() async {
    final res = await _getOfflineModeUsecase.call();
    return res.fold((l) => false, (r) => r);
  }
}
