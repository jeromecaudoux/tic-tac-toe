import 'package:flutter/material.dart' hide Action;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/data/repositories/games_repository.dart';
import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/ui/home/game/board/board_item.dart';

class GameBoard extends ConsumerWidget {
  final TicTacToe game;

  const GameBoard({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int size = game.board.size;
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: <Widget>[
          for (int x = 0; x < size; x++)
            Expanded(
              child: Row(
                children: <Widget>[
                  for (int y = 0; y < size; y++)
                    Expanded(child: _buildBoardItem(context, ref, x, y)),
                ].joinSeparator(_buildHSep),
              ),
            ),
        ].joinSeparator(_buildVSep),
      ),
    );
  }

  Widget get _buildVSep => Container(
    color: Colors.grey[400],
    height: 2,
    width: double.infinity,
  );

  Widget get _buildHSep => Container(
    color: Colors.grey[400],
    width: 2,
    height: double.infinity,
  );

  Widget _buildBoardItem(BuildContext context, WidgetRef ref, int x, int y) {
    void onPlay(int x, int y) async {
      try {
        Action action = Action(x: x, y: y, player: game.nextPlayer);
        await ref.read(gamesRepProvider).onAction(game.gameId, action);
      } catch (e, s) {
        debugPrint('Error performing action: $e\n$s');
        if (context.mounted) {
          showAppToast(getMessage(context, e));
        }
      }
    }

    return BoardItem(game: game, x: x, y: y, onTap: onPlay);
  }
}
