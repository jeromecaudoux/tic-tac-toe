import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide Threshold;
import 'package:flutter_riverpod/flutter_riverpod.dart' hide StateProvider;
import 'package:tictactoe/data/datasource/cache_service.dart';
import 'package:tictactoe/domain/entities/app_config.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/config_providers.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/domain/repositories/i_app_repository.dart';

final appRepProvider = Provider<IAppRepository>(
  (ref) => AppRepository(
    appConfig: ref.read(appConfigProvider),
    gamesContainer: ref.read(gamesContainerProvider.notifier),
    cacheService: ref.read(cacheServiceProvider),
  ),
);

final initProvider = FutureProvider<void>(
  (ref) => ref.read(appRepProvider).init(),
);

class AppRepository extends IAppRepository {
  final GamesContainerNotifier gamesContainer;
  final CacheService cacheService;
  final AppConfig appConfig;
  final DateTime _startTime = DateTime.now();
  final List<String> _initSuccess = [];

  AppRepository({
    required this.appConfig,
    required this.gamesContainer,
    required this.cacheService,
  });

  @override
  Future<bool> init() async {
    try {
      bool vb = appConfig.verbose == true;
      await Future.wait([
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]).then(_onDone(vb, 'SystemChrome')),
        _initGames().then(_onDone(vb, 'CacheService')),
      ]).timeout(const Duration(seconds: 8), onTimeout: _onTimeout);
      Duration diff = DateTime.now().difference(_startTime);
      debugPrint('[Init] all done in ${diff.inMilliseconds}ms');
      return true;
    } catch (e, s) {
      debugPrint('main common failed: $e $s');
    }
    return false;
  }

  OnDone<String, T> _onDone<R, T>(bool verbose, String name) {
    return (T data) async {
      if (verbose) {
        Duration diff = DateTime.now().difference(_startTime);
        debugPrint('[Init] $name initialized in ${diff.inMilliseconds}ms');
      }
      _initSuccess.add(name);
      return name;
    };
  }

  Future<List<T>> _onTimeout<T>() async => [];

  Future<void> _initGames() async {
    final Iterable<TicTacToe> games = await cacheService.games().get() ?? [];
    for (final game in games) {
      gamesContainer.add(game);
    }
  }
}

typedef OnDone<R, T> = Future<R> Function(T value);
