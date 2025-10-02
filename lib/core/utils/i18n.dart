import 'package:flutter/widgets.dart';
import 'package:tictactoe/l10n/app_localizations.dart';

abstract class I18n extends AppLocalizations {
  I18n(super.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      AppLocalizations.localizationsDelegates;
}
