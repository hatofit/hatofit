import 'strings.dart';

/// The translations for English (`en`).
class StringsEn extends Strings {
  StringsEn([String locale = 'en']) : super(locale);

  @override
  String get loading => 'Loading...';

  @override
  String get swipeToChangeTheme => 'Swipe the icon to change theme';

  @override
  String get selectLanguage => 'Select language';

  @override
  String get appPreferences => 'App Preferences';

  @override
  String get adjustPreferences => 'Adjust your preferences';

  @override
  String get chooseLanguage => 'Choose language';

  @override
  String get getStarted => 'Get Started';

  @override
  String get next => 'Next';
}
