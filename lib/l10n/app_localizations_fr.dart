// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get placeholderTitle => 'Oops!';

  @override
  String get youGotLostNothingHere => 'Vous vous êtes perdu ! Rien ici';

  @override
  String get goHomepage => 'Aller à la page d\'accueil';

  @override
  String get back => 'Retour';

  @override
  String get checkInternetConnection => 'Vérifiez votre connexion internet';

  @override
  String get genericError => 'Une erreur est survenue, veuillez réessayer';

  @override
  String get gameOver => 'Partie terminée !';

  @override
  String get playerTurn => 'Tour du joueur';

  @override
  String get exitGame => 'Quitter la partie';

  @override
  String get exitGameText =>
      'Êtes-vous sûr de vouloir quitter la partie ? La partie n\'est pas encore terminée.';

  @override
  String get cancel => 'Annuler';

  @override
  String get exit => 'Quitter';

  @override
  String get itsDraw => 'C\'est une égalité !';

  @override
  String get player => 'Joueur';

  @override
  String get won => 'a gagné !';

  @override
  String get appTitle => 'Jeux de Tic Tac Toe';

  @override
  String get noGamesYet => 'Aucune partie pour le moment';

  @override
  String game(Object hash) {
    return 'Partie #$hash';
  }

  @override
  String get delete => 'Delete';

  @override
  String get deleteGameTitle => 'Supprimer la partie';

  @override
  String get deleteGameText =>
      'Êtes-vous sûr de vouloir supprimer cette partie ?';

  @override
  String get slideToDeleteGame => 'Glisser pour supprimer la partie';

  @override
  String get boardItemAlreadyPlayed => 'Cette position a déjà été jouée';
}
