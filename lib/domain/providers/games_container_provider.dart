import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/games_container.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';

final gamesContainerProvider =
    StateNotifierProvider<GamesContainerNotifier, GamesContainer>((ref) {
      return GamesContainerNotifier();
    });

class GamesContainerNotifier extends StateNotifier<GamesContainer> {
  GamesContainerNotifier() : super(GamesContainer());

  TicTacToe? get(String id) => state.get(id);

  void add(TicTacToe game) => state = state..add(game);

  void remove(String id) => state = state..remove(id);

  void update(TicTacToe game) => state = state..update(game);

  Iterable<TicTacToe> get allGames => state.allGames;
}
