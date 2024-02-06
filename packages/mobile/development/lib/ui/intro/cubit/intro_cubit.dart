import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hatofit/core/constant/constant.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

part 'intro_cubit.freezed.dart';
part 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  final GetUserUsecase _getUserUsecase;
  final UpdateUserUsecase _updateUserUsecase;
  final GetOfflineModeUsecase _getOfflineModeUsecase;
  final GetLanguageUsecase _getLanguageUsecase;
  IntroCubit(
    this._getUserUsecase,
    this._updateUserUsecase,
    this._getOfflineModeUsecase,
    this._getLanguageUsecase,
  ) : super(IntroState());

  Future<void> init() async {
    await getUser();
    await getLang();
    getEnergyUnit();
    getHeightUnit();
    getWeightUnit();
  }

  Future<void> getUser() async {
    final res = await _getUserUsecase.call();
    log.i("res: $res");
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
      type: "en",
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

  Future<void> getLang() async {
    final res = await _getLanguageUsecase.call();
    res.fold((l) => emit(state.copyWith(sLang: listLanguage[0])), (r) {
      final lang = listLanguage.firstWhere((e) => e.type == r);
      emit(state.copyWith(sLang: lang));
    });
  }

  void getEnergyUnit() {
    final user = state.user;
    if (user != null) {
      log.i("user: $user");
      log.i("List: $listEnergyUnit");
      final sEUnit = listEnergyUnit.firstWhere(
        (e) => e.type == user.metricUnits?.energyUnits,
      );
      emit(state.copyWith(sEUnit: sEUnit));
    } else {
      emit(state.copyWith(sEUnit: listEnergyUnit[0]));
    }
  }

  void getHeightUnit() {
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

  void getWeightUnit() {
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
    final user = state.user;
    if (user != null) {
      final res = await _updateUserUsecase.call(
        UpdateUserParams(
          forLocal: true,
          user: user.copyWith(
              metricUnits: user.metricUnits?.copyWith(energyUnits: val)),
        ),
      );
      res.fold((l) => null, (r) => emit(state.copyWith(user: r)));
    }
  }

  Future<void> uHUnit(String val) async {
    final user = state.user;
    if (user != null) {
      final res = await _updateUserUsecase.call(
        UpdateUserParams(
          forLocal: true,
          user: user.copyWith(
            metricUnits: user.metricUnits?.copyWith(heightUnits: val),
          ),
        ),
      );
      res.fold((l) => null, (r) => emit(state.copyWith(user: r)));
    }
  }

  Future<void> uWUnit(String val) async {
    final user = state.user;
    if (user != null) {
      final res = await _updateUserUsecase.call(
        UpdateUserParams(
          forLocal: true,
          user: user.copyWith(
            metricUnits: user.metricUnits?.copyWith(weightUnits: val),
          ),
        ),
      );
      res.fold((l) => null, (r) => emit(state.copyWith(user: r)));
    }
  }

  Future<void> updateGender(String gender) async {
    final user = state.user;
    if (user != null) {
      emit(state.copyWith(user: user.copyWith(gender: gender)));
      await _updateUserUsecase.call(
        UpdateUserParams(forLocal: true, user: user.copyWith(gender: gender)),
      );
    }
  }

  Future<void> updateHeight(int height) async {
    final user = state.user;
    if (user != null) {
      emit(state.copyWith(user: user.copyWith(height: height)));
      await _updateUserUsecase.call(
        UpdateUserParams(forLocal: true, user: user.copyWith(height: height)),
      );
    }
  }

  Future<void> updateWeight(int weight) async {
    final user = state.user;
    if (user != null) {
      emit(state.copyWith(user: user.copyWith(weight: weight)));
      await _updateUserUsecase.call(
        UpdateUserParams(forLocal: true, user: user.copyWith(weight: weight)),
      );
    }
  }

  Future<void> updateDateOfBirth(DateTime dateOfBirth) async {
    final user = state.user;
    if (user != null) {
      emit(state.copyWith(user: user.copyWith(dateOfBirth: dateOfBirth)));
      await _updateUserUsecase.call(
        UpdateUserParams(
            forLocal: true, user: user.copyWith(dateOfBirth: dateOfBirth)),
      );
    }
  }

  Future<void> updateAll() async {
    final user = state.user;
    if (user != null) {
      await _updateUserUsecase.call(
        UpdateUserParams(
          forLocal: true,
          user: user.copyWith(
            height: user.height ?? 150,
            weight: user.weight ?? 125,
            gender: user.gender ?? "male",
          ),
        ),
      );
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
