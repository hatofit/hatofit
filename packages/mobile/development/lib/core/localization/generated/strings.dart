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

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @activityDetails.
  ///
  /// In en, this message translates to:
  /// **'Activity Details'**
  String get activityDetails;

  /// No description provided for @activityTrends.
  ///
  /// In en, this message translates to:
  /// **'Activity Trends'**
  String get activityTrends;

  /// No description provided for @adjustPreferences.
  ///
  /// In en, this message translates to:
  /// **'Adjust your preferences'**
  String get adjustPreferences;

  /// No description provided for @alreadyHaveHatofitAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have a Hatofit account?'**
  String get alreadyHaveHatofitAccount;

  /// No description provided for @appPreferences.
  ///
  /// In en, this message translates to:
  /// **'App Preferences'**
  String get appPreferences;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @areYouSureYouWantToEndWorkout.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to end training?'**
  String get areYouSureYouWantToEndWorkout;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @awful.
  ///
  /// In en, this message translates to:
  /// **'Awful 😞'**
  String get awful;

  /// No description provided for @bodyHeight.
  ///
  /// In en, this message translates to:
  /// **'Body Height'**
  String get bodyHeight;

  /// No description provided for @bodyWeight.
  ///
  /// In en, this message translates to:
  /// **'Body Weight'**
  String get bodyWeight;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @ofMaxHeartRate.
  ///
  /// In en, this message translates to:
  /// **'of Max Heart Rate'**
  String get ofMaxHeartRate;

  /// No description provided for @now.
  ///
  /// In en, this message translates to:
  /// **'Now'**
  String get now;

  /// No description provided for @fiveMinutesPassedWithZeroHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Five minutes passed with zero heart rate'**
  String get fiveMinutesPassedWithZeroHeartRate;

  /// No description provided for @caloriesBurn.
  ///
  /// In en, this message translates to:
  /// **'Calories Burn'**
  String get caloriesBurn;

  /// No description provided for @captureAPhoto.
  ///
  /// In en, this message translates to:
  /// **'Capture a photo'**
  String get captureAPhoto;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @chooseAnEmojiThatRepresentsThisExercise.
  ///
  /// In en, this message translates to:
  /// **'Choose an emoji that represents this exercise'**
  String get chooseAnEmojiThatRepresentsThisExercise;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get chooseLanguage;

  /// No description provided for @deviceDisconnected.
  ///
  /// In en, this message translates to:
  /// **'Device disconnected'**
  String get deviceDisconnected;

  /// No description provided for @chooseTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose Theme'**
  String get chooseTheme;

  /// No description provided for @chooseYourProfilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Choose your profile photo'**
  String get chooseYourProfilePhoto;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @connect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connect;

  /// No description provided for @connectable.
  ///
  /// In en, this message translates to:
  /// **'Connectable'**
  String get connectable;

  /// No description provided for @currentHeartRate.
  ///
  /// In en, this message translates to:
  /// **'Current Heart Rate'**
  String get currentHeartRate;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @device.
  ///
  /// In en, this message translates to:
  /// **'Device'**
  String get device;

  /// No description provided for @deviceIntegration.
  ///
  /// In en, this message translates to:
  /// **'Device Integration'**
  String get deviceIntegration;

  /// No description provided for @didntDetectAnyDevice.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t detect any device 🤔'**
  String get didntDetectAnyDevice;

  /// No description provided for @dintReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get dintReceiveCode;

  /// No description provided for @disconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get disconnect;

  /// No description provided for @disconnectedFromDevice.
  ///
  /// In en, this message translates to:
  /// **'Disconnected from device'**
  String get disconnectedFromDevice;

  /// No description provided for @dontHaveHatofitAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have a Hatofit account?'**
  String get dontHaveHatofitAccount;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @emailSentedPleaseCheckYourInbox.
  ///
  /// In en, this message translates to:
  /// **'Email sent, please check your inbox'**
  String get emailSentedPleaseCheckYourInbox;

  /// No description provided for @endExercise.
  ///
  /// In en, this message translates to:
  /// **'End Exercise'**
  String get endExercise;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @endTraining.
  ///
  /// In en, this message translates to:
  /// **'End Training'**
  String get endTraining;

  /// No description provided for @energyUnit.
  ///
  /// In en, this message translates to:
  /// **'Energy Unit'**
  String get energyUnit;

  /// No description provided for @enterTheCodeThatWasSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the code that was sent to'**
  String get enterTheCodeThatWasSentTo;

  /// No description provided for @enterYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get enterYourNewPassword;

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

  /// No description provided for @errorPasswordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get errorPasswordNotMatch;

  /// No description provided for @exerciseName.
  ///
  /// In en, this message translates to:
  /// **'Exercise Name'**
  String get exerciseName;

  /// No description provided for @avgHR.
  ///
  /// In en, this message translates to:
  /// **'Average Heart Rate'**
  String get avgHR;

  /// No description provided for @exerciseNow.
  ///
  /// In en, this message translates to:
  /// **'Exercise Now'**
  String get exerciseNow;

  /// No description provided for @exerciseSuccessfullySaved.
  ///
  /// In en, this message translates to:
  /// **'Exercise successfully saved'**
  String get exerciseSuccessfullySaved;

  /// No description provided for @failedConnectToDevice.
  ///
  /// In en, this message translates to:
  /// **'Failed connect to device'**
  String get failedConnectToDevice;

  /// No description provided for @failedConnectToServer.
  ///
  /// In en, this message translates to:
  /// **'Failed connect to server. Using offline mode'**
  String get failedConnectToServer;

  /// No description provided for @failedToStartWorkout.
  ///
  /// In en, this message translates to:
  /// **'Failed to start training, to start training, complete your profile'**
  String get failedToStartWorkout;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @firstNameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'First name cannot be empty'**
  String get firstNameCannotBeEmpty;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @freeTraining.
  ///
  /// In en, this message translates to:
  /// **'Free Training'**
  String get freeTraining;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good 😃'**
  String get good;

  /// No description provided for @happy.
  ///
  /// In en, this message translates to:
  /// **'Happy 😊'**
  String get happy;

  /// No description provided for @heartRate.
  ///
  /// In en, this message translates to:
  /// **'Heart Rate'**
  String get heartRate;

  /// No description provided for @heightUnit.
  ///
  /// In en, this message translates to:
  /// **'Height Unit'**
  String get heightUnit;

  /// No description provided for @identifier.
  ///
  /// In en, this message translates to:
  /// **'Identifier'**
  String get identifier;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @lastNameCannotBeEmpty.
  ///
  /// In en, this message translates to:
  /// **'Last name cannot be empty'**
  String get lastNameCannotBeEmpty;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @makeSureYourDeviceIsTurnedOnAndNearby.
  ///
  /// In en, this message translates to:
  /// **'Make sure your device is turned on and nearby'**
  String get makeSureYourDeviceIsTurnedOnAndNearby;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @mood.
  ///
  /// In en, this message translates to:
  /// **'Mood'**
  String get mood;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @neutral.
  ///
  /// In en, this message translates to:
  /// **'Neutral 😐'**
  String get neutral;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @noActivityFound.
  ///
  /// In en, this message translates to:
  /// **'No activity found'**
  String get noActivityFound;

  /// No description provided for @noExerciseDataToday.
  ///
  /// In en, this message translates to:
  /// **'No exercise data today'**
  String get noExerciseDataToday;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @noWorkoutMenuFound.
  ///
  /// In en, this message translates to:
  /// **'No workout menu found'**
  String get noWorkoutMenuFound;

  /// No description provided for @obese.
  ///
  /// In en, this message translates to:
  /// **'Obesitas'**
  String get obese;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @orSignInWith.
  ///
  /// In en, this message translates to:
  /// **'or sign in with'**
  String get orSignInWith;

  /// No description provided for @overweight.
  ///
  /// In en, this message translates to:
  /// **'Kegemukan'**
  String get overweight;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @percentage.
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// No description provided for @pickYourDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Pick your date of birth'**
  String get pickYourDateOfBirth;

  /// No description provided for @pickYourHeight.
  ///
  /// In en, this message translates to:
  /// **'Pick your height'**
  String get pickYourHeight;

  /// No description provided for @pickYourWeight.
  ///
  /// In en, this message translates to:
  /// **'Pick your weight'**
  String get pickYourWeight;

  /// No description provided for @pleaseEnterYourDateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Please enter your date of birth'**
  String get pleaseEnterYourDateOfBirth;

  /// No description provided for @pleaseEnterYourEmailAddressToReceiveVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address to receive verification code'**
  String get pleaseEnterYourEmailAddressToReceiveVerificationCode;

  /// No description provided for @pleaseSelectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Please select your gender'**
  String get pleaseSelectYourGender;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @sad.
  ///
  /// In en, this message translates to:
  /// **'Sad 😔'**
  String get sad;

  /// No description provided for @selectFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Select from gallery'**
  String get selectFromGallery;

  /// No description provided for @selectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Select your gender'**
  String get selectYourGender;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @sessionExpired.
  ///
  /// In en, this message translates to:
  /// **'Session Expired, please sign in again'**
  String get sessionExpired;

  /// No description provided for @setting.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get setting;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sign in successfully'**
  String get signInSuccessfully;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @signUpSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Sign up successfully'**
  String get signUpSuccessfully;

  /// No description provided for @signUpWith.
  ///
  /// In en, this message translates to:
  /// **'Sign up with'**
  String get signUpWith;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @successConnectToDevice.
  ///
  /// In en, this message translates to:
  /// **'Success connect to device'**
  String get successConnectToDevice;

  /// No description provided for @swipeToChangeTheme.
  ///
  /// In en, this message translates to:
  /// **'Swipe the icon to change theme'**
  String get swipeToChangeTheme;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Theme Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Theme Light'**
  String get themeLight;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'Theme System'**
  String get themeSystem;

  /// No description provided for @todayActivity.
  ///
  /// In en, this message translates to:
  /// **'Today Activity'**
  String get todayActivity;

  /// No description provided for @tooManyConnectionAttempts.
  ///
  /// In en, this message translates to:
  /// **'Too many connection attempts, please try again a few minutes later'**
  String get tooManyConnectionAttempts;

  /// No description provided for @toUseThisFeatureYouNeedToConnectYourDevice.
  ///
  /// In en, this message translates to:
  /// **'To use this feature, you need to connect your device'**
  String get toUseThisFeatureYouNeedToConnectYourDevice;

  /// No description provided for @unconnectable.
  ///
  /// In en, this message translates to:
  /// **'Unconnectable'**
  String get unconnectable;

  /// No description provided for @underweight.
  ///
  /// In en, this message translates to:
  /// **'Kurus'**
  String get underweight;

  /// No description provided for @maxHeartRateReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum heart rate reached, please take a break'**
  String get maxHeartRateReached;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @updateProfile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get updateProfile;

  /// No description provided for @userPreferences.
  ///
  /// In en, this message translates to:
  /// **'User Preferences'**
  String get userPreferences;

  /// No description provided for @userUpdated.
  ///
  /// In en, this message translates to:
  /// **'User updated'**
  String get userUpdated;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @weightUnit.
  ///
  /// In en, this message translates to:
  /// **'Weight Unit'**
  String get weightUnit;

  /// No description provided for @whatMoodAreYouIn.
  ///
  /// In en, this message translates to:
  /// **'What mood are you in?'**
  String get whatMoodAreYouIn;

  /// No description provided for @workout.
  ///
  /// In en, this message translates to:
  /// **'Workout'**
  String get workout;

  /// No description provided for @yearsOld.
  ///
  /// In en, this message translates to:
  /// **'years old'**
  String get yearsOld;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @zone.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get zone;
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
