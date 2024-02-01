import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'strings_en.dart';
import 'strings_id.dart';

/// Callers can lookup localized strings with an instance of Strings
/// returned by `Strings.of(context)`.
///
/// Applications need to include `Strings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Strings.localizationsDelegates,
///   supportedLocales: Strings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the Strings.supportedLocales
/// property.
abstract class Strings {
  Strings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Strings? of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  static const LocalizationsDelegate<Strings> delegate = _StringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @swipeToChangeTheme.
  ///
  /// In en, this message translates to:
  /// **'Swipe the icon to change theme'**
  String get swipeToChangeTheme;

  /// No description provided for @appPreferences.
  ///
  /// In en, this message translates to:
  /// **'App Preferences'**
  String get appPreferences;

  /// No description provided for @userPreferences.
  ///
  /// In en, this message translates to:
  /// **'User Preferences'**
  String get userPreferences;

  /// No description provided for @adjustPreferences.
  ///
  /// In en, this message translates to:
  /// **'Adjust your preferences'**
  String get adjustPreferences;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get chooseLanguage;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @weightUnit.
  ///
  /// In en, this message translates to:
  /// **'Weight Unit'**
  String get weightUnit;

  /// No description provided for @heightUnit.
  ///
  /// In en, this message translates to:
  /// **'Height Unit'**
  String get heightUnit;

  /// No description provided for @pickYourWeight.
  ///
  /// In en, this message translates to:
  /// **'Pick your weight'**
  String get pickYourWeight;

  /// No description provided for @pickYourHeight.
  ///
  /// In en, this message translates to:
  /// **'Pick your height'**
  String get pickYourHeight;

  /// No description provided for @selectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Select your gender'**
  String get selectYourGender;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get errorInvalidEmail;

  /// No description provided for @errorPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get errorPasswordLength;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @orSignInWith.
  ///
  /// In en, this message translates to:
  /// **'or sign in with'**
  String get orSignInWith;

  /// No description provided for @dontHaveHatofitAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have a Hatofit account?'**
  String get dontHaveHatofitAccount;

  /// No description provided for @signUpWith.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signUpWith;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @pleaseEnterYourEmailAddressToReceiveVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address to receive verification code'**
  String get pleaseEnterYourEmailAddressToReceiveVerificationCode;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @enterTheCodeThatWasSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the code that was sent to'**
  String get enterTheCodeThatWasSentTo;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @enterYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get enterYourNewPassword;

  /// No description provided for @dintReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get dintReceiveCode;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @emailSentedPleaseCheckYourInbox.
  ///
  /// In en, this message translates to:
  /// **'Email sent, please check your inbox'**
  String get emailSentedPleaseCheckYourInbox;

  /// No description provided for @pickYourDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Pick your date of birth'**
  String get pickYourDateOfBirth;

  /// No description provided for @pleaseEnterYourDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Please enter your date of birth'**
  String get pleaseEnterYourDateOfBirth;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @captureAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Capture a photo'**
  String get captureAPhoto;

  /// No description provided for @selectFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Select from gallery'**
  String get selectFromGallery;

  /// No description provided for @chooseYourProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose your profile photo'**
  String get chooseYourProfilePhoto;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @firstNameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'First name cannot be empty'**
  String get firstNameCannotBeEmpty;

  /// No description provided for @lastNameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Last name cannot be empty'**
  String get lastNameCannotBeEmpty;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @errorPasswordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get errorPasswordNotMatch;

  /// No description provided for @alreadyHaveHatofitAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have a Hatofit account?'**
  String get alreadyHaveHatofitAccount;

  /// No description provided for @energyUnit.
  ///
  /// In en, this message translates to:
  /// **'Energy Unit'**
  String get energyUnit;

  /// No description provided for @signInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sign in successfully'**
  String get signInSuccessfully;

  /// No description provided for @signUpSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sign up successfully'**
  String get signUpSuccessfully;

  /// No description provided for @pleaseSelectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get pleaseSelectYourGender;

  /// No description provided for @todayActivity.
  ///
  /// In en, this message translates to:
  /// **'Today Activity'**
  String get todayActivity;

  /// No description provided for @activityTrends.
  ///
  /// In en, this message translates to:
  /// **'Activity Trends'**
  String get activityTrends;

  /// No description provided for @didntDetectAnyDevice.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t detect any device 🤔'**
  String get didntDetectAnyDevice;

  /// No description provided for @makeSureYourDeviceIsTurnedOnAndNearby.
  ///
  /// In en, this message translates to:
  /// **'Make sure your device is turned on and nearby'**
  String get makeSureYourDeviceIsTurnedOnAndNearby;
}

class _StringsDelegate extends LocalizationsDelegate<Strings> {
  const _StringsDelegate();

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(lookupStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_StringsDelegate old) => false;
}

Strings lookupStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return StringsEn();
    case 'id': return StringsId();
  }

  throw FlutterError(
    'Strings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
