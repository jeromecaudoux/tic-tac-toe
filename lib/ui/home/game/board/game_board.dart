import 'package:flutter/material.dart' hide Action;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/data/repositories/games_repository.dart';
import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/ui/home/game/board/board_item.dart';

class GameBoard extends ConsumerStatefulWidget {
  final TicTacToe game;

  const GameBoard({required this.game, super.key});

  @override
  ConsumerState<GameBoard> createState() => _MyGameBoardState();
}

class _MyGameBoardState extends ConsumerState<GameBoard> {
  @override
  Widget build(BuildContext context) {
    int size = widget.game.board.size;
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: [
          for (int x = 0; x < size; x++)
            Expanded(
              child: Row(
                children: [
                  for (int y = 0; y < size; y++)
                    Expanded(child: _buildBoardItem(x, y)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBoardItem(int x, int y) {
    return BoardItem(game: widget.game, x: x, y: y, onTap: _onPlay);
  }

  Future<void> _onPlay(int x, int y) async {
    try {
      await ref
          .read(gamesRepProvider)
          .onAction(
            widget.game.gameId,
            Action(
              x: x,
              y: y,
              player: widget.game.nextPlayer,
            ),
          );
    } catch (e, s) {
      debugPrint('Error performing action: $e\n$s');
      if (mounted) {
        showAppToast(getMessage(context, e));
      }
    }
  }
}
