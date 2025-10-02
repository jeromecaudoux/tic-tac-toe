import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/domain/entities/player.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/ui/home/game/board/board_item.dart';
import 'package:tictactoe/ui/home/game/board/game_board.dart';

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
                if (game.isGameOver) _buildGameOverOverlay(game),
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
          'Player turn',
          style: TextStyle(
            fontSize: text.h3,
          ),
        ),
        const SizedBox(width: space.half),
        SizedBox.square(
          dimension: 30,
          child: CustomPaint(
            painter: PlayerMarkPainter(player: game.nextPlayer),
            child: const SizedBox.expand(),
          ),
        ),
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
          title: const Text('Exit Game'),
          content: const Text(
            'Are you sure you want to exit the game? Your progress will be lost.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => context.pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => context.pop(true),
              child: const Text('Exit'),
            ),
          ],
        );
      },
    );
    if (mounted && confirmed == true) {
      context.pop();
    }
  }

  Widget _buildGameOverOverlay(TicTacToe game) {
    Player? winner = game.board.winner;
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(space.normal),
            child: Padding(
              padding: const EdgeInsets.all(space.normal),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    winner == Player.none
                        ? 'It\'s a Draw!'
                        : 'Player ${winner == Player.X ? 'X' : 'O'} Wins!',
                    style: TextStyle(
                      fontSize: text.h4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: space.normal),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Exit Game'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
