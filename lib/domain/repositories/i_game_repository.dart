import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';

abstract class IGamesRepository {
  Stream<TicTacToe> stream(String gameId);

  Future<void> onAction(Action action);
}
