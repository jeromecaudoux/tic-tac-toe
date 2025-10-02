// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get placeholderTitle => 'Oops!';

  @override
  String get youGotLostNothingHere => 'You got lost ! Nothing here';

  @override
  String get goHomepage => 'Go to homepage';

  @override
  String get back => 'Back';

  @override
  String get updateRequired => 'Update required';

  @override
  String get updateRequiredMessage =>
      'The current version of the application is no longer supported, please update the application';

  @override
  String get update => 'Update';

  @override
  String get checkInternetConnection => 'Check your internet connection';

  @override
  String get genericError => 'An error occurred, please try again';

  @override
  String get about => 'About';

  @override
  String get termsOfService => 'Terms of service';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get version => 'Version';

  @override
  String get myAccount => 'My account';

  @override
  String get signOut => 'Log out';

  @override
  String get signOutConfirmation => 'Are you sure you want to log out ?';

  @override
  String get cancel => 'Cancel';

  @override
  String get settings => 'Settings';

  @override
  String get rateApp => 'Rate the app';

  @override
  String get language => 'Language';

  @override
  String get notificationSound => 'Notification sound';

  @override
  String get english => 'English';

  @override
  String get french => 'French';

  @override
  String get signIn => 'Sign in';

  @override
  String get password => 'Password';

  @override
  String get loginTitle => 'Connect to your account';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get invalidPasswordLength => 'Password must be at least 6 characters';

  @override
  String get requiredTextField => 'This field is required';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidCredential => 'Invalid credentials';

  @override
  String get noAnswerBefore => 'There is no older answer';

  @override
  String get noAnswerAfter => 'There is no newer answer';

  @override
  String get dailyReminderChannelName => 'Daily Reminder';

  @override
  String get dailyReminderTitle => 'Daily Reminder';

  @override
  String get dailyReminderBody => 'Answer your daily question now :)';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationTime => 'Notification time';

  @override
  String get notificationsDisabled => 'Notifications are disabled';

  @override
  String notificationsEnabled(Object time) {
    return 'Next notification will be at $time';
  }

  @override
  String get accountTitle => 'My Account';

  @override
  String get accountDescription =>
      'To use this account on another device, scan the QR code below.';

  @override
  String get accountImportantNote =>
      'Important:\n- Do not share this QR code as it provides access to your account.\n- Scanning a QR code will change your account on the device (answers will be lost).';

  @override
  String get scanQrCode => 'Scan & connect';

  @override
  String get showQrCode => 'My QR code';

  @override
  String get invalidQrCodeFormat => 'Invalid QR code format';

  @override
  String get signedInSuccessfully => 'Signed in successfully';

  @override
  String get contactUs => 'Contact us';

  @override
  String get contactUsDescription =>
      'Report bugs, suggest features or any other request.';

  @override
  String get contactUsPageDescription =>
      'Report bugs, suggest features or any other request you may have.\nPlease add your email in the message if you expect a response.';

  @override
  String get contactUsHint => 'Write your message here...';

  @override
  String get send => 'Send';

  @override
  String get helpRequestSent =>
      'Your request has been sent successfully. We will get back to you as soon as possible.';

  @override
  String get save => 'Save';

  @override
  String get questionSaved => 'Question saved';

  @override
  String get security => 'Security';

  @override
  String get securityDescription =>
      'Enable biometric authentication to access the app.';

  @override
  String get enableBiometricAuthReason => 'Enable biometric authentication';

  @override
  String get biometricUnsupported =>
      'Biometric authentication is not supported on this device';

  @override
  String get biometricUnknownError =>
      'Enabling biometric authentication failed';

  @override
  String get biometricNothingAvailable =>
      'No biometric authentication method is available on this device';

  @override
  String get openSettings => 'Settings';

  @override
  String get enrollBiometricTitle => 'Biometric authentication required';

  @override
  String get enrollBiometricDescription =>
      'To enable biometric authentication, please enroll a biometric authentication method (fingerprint, face recognition, etc.) in your device settings.';

  @override
  String get appLockedMessage =>
      'App is locked, please authenticate to continue';

  @override
  String get retryAuthentication => 'Retry';

  @override
  String get noQuestionForThisDay =>
      'Oops! There is no question for this day.\nWe\'re on it!';

  @override
  String get editQuestionTitle => 'Edit question';

  @override
  String get enterQuestionHint => 'Enter your question here...';

  @override
  String get noAnswerForThisQuestion =>
      'You haven\'t answered this question yet.';

  @override
  String get securityTitle => 'Lock app on launch';

  @override
  String get notificationsTitle => 'Enable notifications';

  @override
  String get general => 'General';

  @override
  String get saving => 'Saving...';

  @override
  String get notificationsDescription =>
      'Receive a daily notification to answer your question.';

  @override
  String get close => 'Close';

  @override
  String get startWriting => 'Start writing an answer...';

  @override
  String get aboutAppName => 'Journal de Questions';

  @override
  String get aboutTagline =>
      ' — one question per day to reflect and keep track of your growth.';

  @override
  String get aboutPsychologistName => 'Liria Goularte';

  @override
  String get aboutPsychologistRole =>
      ' — psychologist who authored the questions.\n';

  @override
  String get aboutEmailLabel => 'Email: ';

  @override
  String get aboutPsychologistEmail => 'liria.goularte@example.com';

  @override
  String get aboutDevName => 'Jérôme Caudoux';

  @override
  String get aboutDevRole => ' — developer of the app.\n';

  @override
  String get aboutDevEmail => 'jerome@skyhook.fr';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get colorTheme => 'Color theme';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get fontSizeSmall => 'Small';

  @override
  String get fontSizeNormal => 'Normal';

  @override
  String get fontSizeMedium => 'Medium';

  @override
  String get fontSizeLarge => 'Large';

  @override
  String get fontSizeHuge => 'Huge';

  @override
  String get aboutThanks => 'Thank you for your trust, and happy writing!';
}
