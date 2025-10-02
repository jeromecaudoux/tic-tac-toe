import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/router/router.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/data/repositories/games_repository.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe Games'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _createGame,
          ),
        ],
      ),
      body: _buildGames(),
    );
  }

  Future<void> _createGame() async {
    try {
      TicTacToe game = await ref.read(gamesRepProvider).newGame();
      debugPrint('Created game: ${game.gameId}');
    } catch (e, s) {
      debugPrint('Failed to create game: $e, $s');
      if (mounted) {
        showAppToast(getMessage(context, e));
      }
    }
  }

  Widget _buildGames() {
    return Consumer(
      builder: (context, ref, child) {
        final Iterable<TicTacToe> games = ref.watch(
          gamesContainerProvider.select((container) => container.allGames),
        );
        if (games.isEmpty) {
          return const Center(child: Text('No game found'));
        }
        return ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index) {
            final game = games.elementAt(index);
            return ListTile(
              title: Text('Game ${game.gameId}'),
              subtitle: Text('Turn: ${game.player}'),
              onTap: () {
                context.push(
                  Routes.game.build(path: {'id': game.gameId}),
                );
              },
            );
          },
        );
      },
    );
  }
}
