import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/app_config.dart';
import 'package:tictactoe/domain/providers/config_providers.dart';
import 'package:tictactoe/ui/app.dart';

void init(AppConfig config) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: [appConfigOverrideProvider(config)],
      child: App(),
    ),
  );
}
