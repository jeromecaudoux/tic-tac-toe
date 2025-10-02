import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @placeholderTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops!'**
  String get placeholderTitle;

  /// No description provided for @youGotLostNothingHere.
  ///
  /// In en, this message translates to:
  /// **'You got lost ! Nothing here'**
  String get youGotLostNothingHere;

  /// No description provided for @goHomepage.
  ///
  /// In en, this message translates to:
  /// **'Go to homepage'**
  String get goHomepage;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @updateRequired.
  ///
  /// In en, this message translates to:
  /// **'Update required'**
  String get updateRequired;

  /// No description provided for @updateRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'The current version of the application is no longer supported, please update the application'**
  String get updateRequiredMessage;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @checkInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection'**
  String get checkInternetConnection;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again'**
  String get genericError;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get myAccount;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get signOut;

  /// No description provided for @signOutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out ?'**
  String get signOutConfirmation;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @rateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get rateApp;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @notificationSound.
  ///
  /// In en, this message translates to:
  /// **'Notification sound'**
  String get notificationSound;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect to your account'**
  String get loginTitle;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @invalidPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get invalidPasswordLength;

  /// No description provided for @requiredTextField.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get requiredTextField;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @invalidCredential.
  ///
  /// In en, this message translates to:
  /// **'Invalid credentials'**
  String get invalidCredential;

  /// No description provided for @noAnswerBefore.
  ///
  /// In en, this message translates to:
  /// **'There is no older answer'**
  String get noAnswerBefore;

  /// No description provided for @noAnswerAfter.
  ///
  /// In en, this message translates to:
  /// **'There is no newer answer'**
  String get noAnswerAfter;

  /// No description provided for @dailyReminderChannelName.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminder'**
  String get dailyReminderChannelName;

  /// No description provided for @dailyReminderTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily Reminder'**
  String get dailyReminderTitle;

  /// No description provided for @dailyReminderBody.
  ///
  /// In en, this message translates to:
  /// **'Answer your daily question now :)'**
  String get dailyReminderBody;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationTime.
  ///
  /// In en, this message translates to:
  /// **'Notification time'**
  String get notificationTime;

  /// No description provided for @notificationsDisabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications are disabled'**
  String get notificationsDisabled;

  /// No description provided for @notificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Next notification will be at {time}'**
  String notificationsEnabled(Object time);

  /// No description provided for @accountTitle.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get accountTitle;

  /// No description provided for @accountDescription.
  ///
  /// In en, this message translates to:
  /// **'To use this account on another device, scan the QR code below.'**
  String get accountDescription;

  /// No description provided for @accountImportantNote.
  ///
  /// In en, this message translates to:
  /// **'Important:\n- Do not share this QR code as it provides access to your account.\n- Scanning a QR code will change your account on the device (answers will be lost).'**
  String get accountImportantNote;

  /// No description provided for @scanQrCode.
  ///
  /// In en, this message translates to:
  /// **'Scan & connect'**
  String get scanQrCode;

  /// No description provided for @showQrCode.
  ///
  /// In en, this message translates to:
  /// **'My QR code'**
  String get showQrCode;

  /// No description provided for @invalidQrCodeFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid QR code format'**
  String get invalidQrCodeFormat;

  /// No description provided for @signedInSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Signed in successfully'**
  String get signedInSuccessfully;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get contactUs;

  /// No description provided for @contactUsDescription.
  ///
  /// In en, this message translates to:
  /// **'Report bugs, suggest features or any other request.'**
  String get contactUsDescription;

  /// No description provided for @contactUsPageDescription.
  ///
  /// In en, this message translates to:
  /// **'Report bugs, suggest features or any other request you may have.\nPlease add your email in the message if you expect a response.'**
  String get contactUsPageDescription;

  /// No description provided for @contactUsHint.
  ///
  /// In en, this message translates to:
  /// **'Write your message here...'**
  String get contactUsHint;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @helpRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Your request has been sent successfully. We will get back to you as soon as possible.'**
  String get helpRequestSent;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @questionSaved.
  ///
  /// In en, this message translates to:
  /// **'Question saved'**
  String get questionSaved;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @securityDescription.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric authentication to access the app.'**
  String get securityDescription;

  /// No description provided for @enableBiometricAuthReason.
  ///
  /// In en, this message translates to:
  /// **'Enable biometric authentication'**
  String get enableBiometricAuthReason;

  /// No description provided for @biometricUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication is not supported on this device'**
  String get biometricUnsupported;

  /// No description provided for @biometricUnknownError.
  ///
  /// In en, this message translates to:
  /// **'Enabling biometric authentication failed'**
  String get biometricUnknownError;

  /// No description provided for @biometricNothingAvailable.
  ///
  /// In en, this message translates to:
  /// **'No biometric authentication method is available on this device'**
  String get biometricNothingAvailable;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get openSettings;

  /// No description provided for @enrollBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometric authentication required'**
  String get enrollBiometricTitle;

  /// No description provided for @enrollBiometricDescription.
  ///
  /// In en, this message translates to:
  /// **'To enable biometric authentication, please enroll a biometric authentication method (fingerprint, face recognition, etc.) in your device settings.'**
  String get enrollBiometricDescription;

  /// No description provided for @appLockedMessage.
  ///
  /// In en, this message translates to:
  /// **'App is locked, please authenticate to continue'**
  String get appLockedMessage;

  /// No description provided for @retryAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryAuthentication;

  /// No description provided for @noQuestionForThisDay.
  ///
  /// In en, this message translates to:
  /// **'Oops! There is no question for this day.\nWe\'re on it!'**
  String get noQuestionForThisDay;

  /// No description provided for @editQuestionTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit question'**
  String get editQuestionTitle;

  /// No description provided for @enterQuestionHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your question here...'**
  String get enterQuestionHint;

  /// No description provided for @noAnswerForThisQuestion.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t answered this question yet.'**
  String get noAnswerForThisQuestion;

  /// No description provided for @securityTitle.
  ///
  /// In en, this message translates to:
  /// **'Lock app on launch'**
  String get securityTitle;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable notifications'**
  String get notificationsTitle;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving...'**
  String get saving;

  /// No description provided for @notificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive a daily notification to answer your question.'**
  String get notificationsDescription;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @startWriting.
  ///
  /// In en, this message translates to:
  /// **'Start writing an answer...'**
  String get startWriting;

  /// No description provided for @aboutAppName.
  ///
  /// In en, this message translates to:
  /// **'Journal de Questions'**
  String get aboutAppName;

  /// No description provided for @aboutTagline.
  ///
  /// In en, this message translates to:
  /// **' — one question per day to reflect and keep track of your growth.'**
  String get aboutTagline;

  /// No description provided for @aboutPsychologistName.
  ///
  /// In en, this message translates to:
  /// **'Liria Goularte'**
  String get aboutPsychologistName;

  /// No description provided for @aboutPsychologistRole.
  ///
  /// In en, this message translates to:
  /// **' — psychologist who authored the questions.\n'**
  String get aboutPsychologistRole;

  /// No description provided for @aboutEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email: '**
  String get aboutEmailLabel;

  /// No description provided for @aboutPsychologistEmail.
  ///
  /// In en, this message translates to:
  /// **'liria.goularte@example.com'**
  String get aboutPsychologistEmail;

  /// No description provided for @aboutDevName.
  ///
  /// In en, this message translates to:
  /// **'Jérôme Caudoux'**
  String get aboutDevName;

  /// No description provided for @aboutDevRole.
  ///
  /// In en, this message translates to:
  /// **' — developer of the app.\n'**
  String get aboutDevRole;

  /// No description provided for @aboutDevEmail.
  ///
  /// In en, this message translates to:
  /// **'jerome@skyhook.fr'**
  String get aboutDevEmail;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get fieldRequired;

  /// No description provided for @colorTheme.
  ///
  /// In en, this message translates to:
  /// **'Color theme'**
  String get colorTheme;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @fontSizeSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get fontSizeSmall;

  /// No description provided for @fontSizeNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get fontSizeNormal;

  /// No description provided for @fontSizeMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get fontSizeMedium;

  /// No description provided for @fontSizeLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get fontSizeLarge;

  /// No description provided for @fontSizeHuge.
  ///
  /// In en, this message translates to:
  /// **'Huge'**
  String get fontSizeHuge;

  /// No description provided for @aboutThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your trust, and happy writing!'**
  String get aboutThanks;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
