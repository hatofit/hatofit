import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/utils/utils.dart';

class SettingsCubit extends Cubit<DataHelper> {
  final GetActiveThemeUsecase _getActiveThemeUsecase;
  final UpdateActiveThemeUsecase _updateActiveThemeUsecase;
  final GetLanguageUsecase _getLanguageUsecase;
  final UpdateLanguageUsecase _updateLanguageUsecase;
  final GetUserUsecase _getUserUsecase;
  final UpdateUserUsecase _updateUserUsecase;
  SettingsCubit(
    this._getActiveThemeUsecase,
    this._updateActiveThemeUsecase,
    this._getLanguageUsecase,
    this._updateLanguageUsecase,
    this._getUserUsecase,
    this._updateUserUsecase,
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
    await _updateLanguageUsecase.call(type);
    safeEmit(
      DataHelper(
        type: type,
        activeTheme: await getActiveTheme(),
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
    _updateLanguageUsecase.call(locale);
    final res = await _getUserUsecase.call();
    res.fold((l) => null, (r) {
      _updateUserUsecase.call(UpdateUserParams(
        forLocal: true,
        user: r.copyWith(
          metricUnits: UserMetricUnitsEntity(
            heightUnits: heightUnit,
            weightUnits: weightUnit,
            energyUnits: energyUnit,
          ),
        ),
      ));
    });
  }

  Future<ActiveTheme> getActiveTheme() async {
    final res = await _getActiveThemeUsecase.call();
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
}
