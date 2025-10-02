// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get placeholderTitle => 'Oups !';

  @override
  String get youGotLostNothingHere => 'Vous êtes perdu ! Rien ici';

  @override
  String get goHomepage => 'Aller à la page d\'accueil';

  @override
  String get back => 'Retour';

  @override
  String get checkInternetConnection => 'Vérifiez votre connexion Internet';

  @override
  String get genericError => 'Une erreur est survenue, veuillez réessayer';

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
  String get boardItemAlreadyPlayed => 'This item has already been played';
}
