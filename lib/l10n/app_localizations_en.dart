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
  String get checkInternetConnection => 'Check your internet connection';

  @override
  String get genericError => 'An error occurred, please try again';

  @override
  String get gameOver => 'Game Over !';

  @override
  String get boardItemAlreadyPlayed => 'This item has already been played';
}
