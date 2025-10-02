import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/ui/home/game/game_board.dart';

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
        body: GameBoard(game: game),
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
}
