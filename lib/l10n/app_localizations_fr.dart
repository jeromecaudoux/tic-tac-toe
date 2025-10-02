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
  String get updateRequired => 'Mise à jour requise';

  @override
  String get updateRequiredMessage =>
      'La version actuelle de l\'application n\'est plus supportée, veuillez mettre à jour l\'application';

  @override
  String get update => 'Mettre à jour';

  @override
  String get checkInternetConnection => 'Vérifiez votre connexion Internet';

  @override
  String get genericError => 'Une erreur est survenue, veuillez réessayer';

  @override
  String get about => 'À propos';

  @override
  String get termsOfService => 'Conditions d\'utilisation';

  @override
  String get privacyPolicy => 'Politique de confidentialité';

  @override
  String get version => 'Version';

  @override
  String get myAccount => 'Mon compte';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get signOutConfirmation =>
      'Êtes-vous sûr de vouloir vous déconnecter ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get settings => 'Paramètres';

  @override
  String get rateApp => 'Noter l\'application';

  @override
  String get language => 'Langue';

  @override
  String get notificationSound => 'Son de notification';

  @override
  String get english => 'Anglais';

  @override
  String get french => 'Français';

  @override
  String get signIn => 'Se connecter';

  @override
  String get password => 'Mot de passe';

  @override
  String get loginTitle => 'Qui va tester ?';

  @override
  String get passwordRequired => 'Le mot de passe est requis';

  @override
  String get invalidPasswordLength =>
      'Le mot de passe doit comporter au moins 6 caractères';

  @override
  String get requiredTextField => 'Ce champ est requis';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get invalidCredential => 'Identifiants invalides';

  @override
  String get noAnswerBefore => 'Il n\'y a pas de réponse plus ancienne';

  @override
  String get noAnswerAfter => 'Il n\'y a pas de réponse plus récente';

  @override
  String get dailyReminderChannelName => 'Daily Reminder';

  @override
  String get dailyReminderTitle => 'Rappel quotidien';

  @override
  String get dailyReminderBody => 'Répondez à votre question quotidienne :)';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationTime => 'Heure de la notification';

  @override
  String get notificationsDisabled => 'Notifications désactivées';

  @override
  String notificationsEnabled(Object time) {
    return 'La prochaine notification sera à $time';
  }

  @override
  String get accountTitle => 'Mon compte';

  @override
  String get accountDescription =>
      'To use this account on another device, scan the QR code below.';

  @override
  String get accountImportantNote =>
      'Important:\n- Do not share this QR code as it provides access to your account.\n- Scanning a QR code will change your account on the device (answers will be lost).';

  @override
  String get scanQrCode => 'Scanner & se connecter';

  @override
  String get showQrCode => 'Mon QR code';

  @override
  String get invalidQrCodeFormat => 'Format de QR code invalide';

  @override
  String get signedInSuccessfully => 'Connecté avec succès';

  @override
  String get contactUs => 'Nous contacter';

  @override
  String get contactUsDescription =>
      'Signaler des bugs, suggérer des fonctionnalités ou toute autre demande.';

  @override
  String get contactUsPageDescription =>
      'Signaler des bugs, suggérer des fonctionnalités ou toute autre demande.\nVeuillez ajouter votre email dans le message si vous attendez une réponse.';

  @override
  String get contactUsHint => 'Écrivez votre message ici...';

  @override
  String get send => 'Envoyer';

  @override
  String get helpRequestSent =>
      'Votre demande a été envoyée avec succès. Nous vous répondrons dès que possible.';

  @override
  String get save => 'Enregistrer';

  @override
  String get questionSaved => 'Question enregistrée';

  @override
  String get security => 'Sécurité';

  @override
  String get securityDescription =>
      'Activer l\'authentification biométrique pour accéder à l\'application.';

  @override
  String get enableBiometricAuthReason =>
      'Activer l\'authentification biométrique';

  @override
  String get biometricUnsupported =>
      'L\'authentification biométrique n\'est pas prise en charge sur cet appareil';

  @override
  String get biometricUnknownError =>
      'Une erreur inconnue est survenue lors de l\'authentification biométrique';

  @override
  String get biometricNothingAvailable =>
      'Aucune méthode d\'authentification biométrique n\'est disponible sur cet appareil';

  @override
  String get openSettings => 'Paramètres';

  @override
  String get enrollBiometricTitle => 'Authentification biométrique requise';

  @override
  String get enrollBiometricDescription =>
      'Veuillez enregistrer une méthode d\'authentification biométrique (empreinte digitale, reconnaissance faciale, etc.) dans les paramètres de votre appareil avant d\'activer cette fonctionnalité.';

  @override
  String get appLockedMessage =>
      'L\'application est verrouillée, veuillez vous authentifier pour continuer';

  @override
  String get retryAuthentication => 'Réessayer';

  @override
  String get noQuestionForThisDay =>
      'Oups ! Il n\'y a pas de question pour ce jour.\nNous y travaillons !';

  @override
  String get editQuestionTitle => 'Modifier la question';

  @override
  String get enterQuestionHint => 'Saisissez votre question ici...';

  @override
  String get noAnswerForThisQuestion =>
      'Vous n\'avez pas encore répondu à cette question.';

  @override
  String get securityTitle => 'Verrouillage de l\'application';

  @override
  String get notificationsTitle => 'Activer les notifications';

  @override
  String get general => 'Général';

  @override
  String get saving => 'Enregistrement...';

  @override
  String get notificationsDescription =>
      'Recevez une notification quotidienne pour répondre à votre question.';

  @override
  String get close => 'Fermer';

  @override
  String get startWriting => 'Commencez à écrire une réponse...';

  @override
  String get aboutAppName => 'Journal de Questions';

  @override
  String get aboutTagline =>
      ' — une question par jour pour réfléchir et garder une trace de votre évolution.';

  @override
  String get aboutPsychologistName => 'Liria Goularte';

  @override
  String get aboutPsychologistRole =>
      ' — psychologue qui a rédigé les questions.\n';

  @override
  String get aboutEmailLabel => 'Email : ';

  @override
  String get aboutPsychologistEmail => 'liria.goularte@example.com';

  @override
  String get aboutDevName => 'Jérôme Caudoux';

  @override
  String get aboutDevRole => ' — développeur de l’app.\n';

  @override
  String get aboutDevEmail => 'jerome@skyhook.fr';

  @override
  String get fieldRequired => 'This field is required';

  @override
  String get colorTheme => 'Thème de couleur';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get fontSizeSmall => 'Petite';

  @override
  String get fontSizeNormal => 'Normale';

  @override
  String get fontSizeMedium => 'Moyenne';

  @override
  String get fontSizeLarge => 'Grande';

  @override
  String get fontSizeHuge => 'Énorme';

  @override
  String get aboutThanks => 'Merci de votre confiance et bonne écriture !';
}
