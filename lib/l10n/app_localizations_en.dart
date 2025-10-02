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
  String get playerTurn => 'Player turn';

  @override
  String get exitGame => 'Exit Game';

  @override
  String get exitGameText =>
      'Are you sure you want to exit the game? Game is not over yet.';

  @override
  String get cancel => 'Cancel';

  @override
  String get exit => 'Exit';

  @override
  String get itsDraw => 'It\'s a Draw!';

  @override
  String get player => 'Player';

  @override
  String get won => 'won !';

  @override
  String get appTitle => 'Tic Tac Toe Games';

  @override
  String get noGamesYet => 'No games yet';

  @override
  String game(Object hash) {
    return 'Game #$hash';
  }

  @override
  String get delete => 'Delete';

  @override
  String get deleteGameTitle => 'Delete Game';

  @override
  String get deleteGameText => 'Are you sure you want to delete this game?';

  @override
  String get slideToDeleteGame => 'Slide to delete game';

  @override
  String get boardItemAlreadyPlayed => 'This position has already been played';
}
