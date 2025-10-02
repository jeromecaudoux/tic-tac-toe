import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/data/datasource/cache_service.dart';
import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/domain/repositories/i_game_repository.dart';

final gamesRepProvider = Provider<IGamesRepository>((ref) {
  return GamesRepository(
    cacheService: ref.read(cacheServiceProvider),
    gamesContainer: ref.read(gamesContainerProvider.notifier),
  );
});

class GamesRepository extends IGamesRepository {
  final CacheService cacheService;
  final GamesContainerNotifier gamesContainer;

  GamesRepository({required this.cacheService, required this.gamesContainer});

  @override
  Future<void> onAction(Action action) {
    // TODO: implement onAction
    throw UnimplementedError();
  }

  @override
  Stream<TicTacToe> stream(String gameId) {
    // TODO: implement stream
    throw UnimplementedError();
  }
}
