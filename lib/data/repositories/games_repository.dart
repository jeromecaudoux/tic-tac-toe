import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/data/datasource/cache_service.dart';
import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/app_config.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/config_providers.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/domain/repositories/i_games_repository.dart';
import 'package:uuid/uuid.dart';

final gamesRepProvider = Provider<IGamesRepository>((ref) {
  return GamesRepository(
    appConfig: ref.read(appConfigProvider),
    cacheService: ref.read(cacheServiceProvider),
    gamesContainer: ref.read(gamesContainerProvider.notifier),
  );
});

class GamesRepository extends IGamesRepository {
  final AppConfig appConfig;
  final CacheService cacheService;
  final GamesContainerNotifier gamesContainer;

  GamesRepository({
    required this.appConfig,
    required this.cacheService,
    required this.gamesContainer,
  });

  @override
  Future<void> onAction(Action action) {
    // TODO: implement onAction
    throw UnimplementedError();
  }

  @override
  Future<TicTacToe> newGame() async {
    final game = TicTacToe.create(
      gameId: const Uuid().v4(),
      boardSize: appConfig.boardSize,
    );
    gamesContainer.add(game);
    // todo save to cache
    return game;
  }
}
