import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/utils/utils.dart';

class SettingsCubit extends Cubit<DataHelper> with MainBoxMixin {
  SettingsCubit() : super(DataHelper(type: "en"));

  void updateTheme(ActiveTheme activeTheme) {
    addData(MainBoxKeys.theme, activeTheme.name);
    safeEmit(
      DataHelper(
        activeTheme: activeTheme,
        type: getData(MainBoxKeys.locale) ?? "en",
      ),
      emit: emit,
      isClosed: isClosed,
    );
  }

  void updateLanguage(String type) {
    addData(MainBoxKeys.locale, type);
    safeEmit(
      DataHelper(
        type: type,
        activeTheme: getActiveTheme(),
      ),
      emit: emit,
      isClosed: isClosed,
    );
  }

  void updateAll(
    ActiveTheme theme,
    String locale,
    String heightUnit,
    String weightUnit,
  ) {
    addData(MainBoxKeys.theme, theme.name);
    addData(MainBoxKeys.locale, locale);
    addData(MainBoxKeys.heightUnit, heightUnit);
    addData(MainBoxKeys.weightUnit, weightUnit);
  }

  ActiveTheme getActiveTheme() {
    final activeTheme = ActiveTheme.values.singleWhere(
      (element) =>
          element.name ==
          (getData(MainBoxKeys.theme) ?? ActiveTheme.system.name),
    );
    safeEmit(
      DataHelper(
        activeTheme: activeTheme,
        type: getData(MainBoxKeys.locale) ?? "en",
      ),
      emit: emit,
      isClosed: isClosed,
    );
    return activeTheme;
  }
}
