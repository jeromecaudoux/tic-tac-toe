import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';

abstract class IGamesRepository {
  Future<TicTacToe> newGame();

  Future<void> onAction(String gameId, Action action);

  Future<void> delete(String gameId);
}
