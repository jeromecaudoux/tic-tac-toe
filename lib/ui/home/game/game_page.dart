import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/ui/home/game/board/game_board.dart';
import 'package:tictactoe/ui/home/game/game_over_overlay.dart';
import 'package:tictactoe/ui/home/game/player_icon.dart';

class GamePage extends ConsumerStatefulWidget {
  final String gameId;
  const GamePage({required this.gameId, super.key});

  @override
  ConsumerState<GamePage> createState() => _MyGamePageState();
}

class _MyGamePageState extends ConsumerState<GamePage> {
  @override
  Widget build(BuildContext context) {
    TicTacToe game = ref.watch(
      gamesContainerProvider.select(
        (container) => container.get(widget.gameId),
      ),
    );
    return PopScope(
      canPop: game.isGameOver,
      onPopInvokedWithResult: (bool didPop, _) async {
        if (!didPop) {
          return _showPopConfirmationDialog();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            _buildPlayerTurn(game),
            Stack(
              children: [
                GameBoard(game: game),
                if (game.isGameOver) GameOverOverlay(game: game),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerTurn(TicTacToe game) {
    List<Widget> children;
    if (game.isGameOver) {
      children = [
        Text(
          I18n.of(context).gameOver,
          style: TextStyle(
            fontSize: text.h3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ];
    } else {
      children = [
        Text(
          I18n.of(context).playerTurn,
          style: TextStyle(
            fontSize: text.h3,
          ),
        ),
        const SizedBox(width: space.half),
        PlayerIcon(player: game.nextPlayer),
      ];
    }
    return Padding(
      padding: const EdgeInsets.all(space.normal),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Future<void> _showPopConfirmationDialog() async {
    bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(I18n.of(context).exitGame),
          content: Text(I18n.of(context).exitGameText),
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(false),
              child: Text(I18n.of(context).cancel),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: Text(I18n.of(context).exit),
            ),
          ],
        );
      },
    );
    if (mounted && confirmed == true) {
      context.pop();
    }
  }
}
