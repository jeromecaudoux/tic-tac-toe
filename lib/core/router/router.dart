import 'package:flutter/material.dart' hide Route;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/router/error_page.dart';
import 'package:tictactoe/core/router/route.dart';
import 'package:tictactoe/domain/entities/app_config.dart';
import 'package:tictactoe/domain/providers/config_providers.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/ui/home/home_page.dart';
import 'package:tictactoe/ui/home/game/game_page.dart';

final goRouterProvider = Provider<Routes>((ref) {
  return Routes(
    ref.read(appConfigProvider),
    ref.read(gamesContainerProvider.notifier),
  );
});

class Routes {
  static const Route home = Route('/');
  static const Route game = Route('/game/:id');

  final AppConfig appConfig;
  final GamesContainerNotifier? gamesContainerNotifier;

  GoRouter? _router;

  GoRouter? get router => _router;
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root',
  );

  Routes(this.appConfig, this.gamesContainerNotifier);

  GoRouter build() {
    return _router ??= GoRouter(
      initialLocation: home.path,
      debugLogDiagnostics: appConfig.verbose == true,
      navigatorKey: _rootNavigatorKey,
      errorBuilder: (context, state) =>
          ErrorScreen(error: state.error!, fullPath: state.fullPath),
      redirect: _doRedirect,
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (_, state) => const HomePage(),
          routes: [
            GoRoute(
              path: 'game/:id',
              builder: (_, state) =>
                  GamePage(gameId: state.pathParameters['id']!),
            ),
          ],
        ),
      ],
    );
  }

  String? _doRedirect(BuildContext context, GoRouterState state) {
    // Check game existence
    if (state.uri.path.startsWith('/game/')) {
      String? gameId = state.pathParameters['id'];
      if (gameId != null && gamesContainerNotifier?.get(gameId) == null) {
        return Routes.home.path;
      }
    }
    return null;
  }
}
