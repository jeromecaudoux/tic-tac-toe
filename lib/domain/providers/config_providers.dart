import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/app_config.dart';

Override appConfigOverrideProvider(AppConfig config) =>
    appConfigProvider.overrideWith((ref) => AppConfigNotifier(config));

final appConfigProvider = StateNotifierProvider<AppConfigNotifier, AppConfig>((
  ref,
) {
  return AppConfigNotifier(AppConfig.none());
});

class AppConfigNotifier extends StateNotifier<AppConfig> {
  AppConfigNotifier(super.state);
}
