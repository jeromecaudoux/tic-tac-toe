import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/data/repositories/games_repository.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';
import 'package:tictactoe/ui/home/game/game_item.dart';

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
        title: Text(I18n.of(context).appTitle),
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
          return Center(child: Text(I18n.of(context).noGamesYet));
        }
        return ListView.builder(
          itemCount: games.length,
          itemBuilder: (context, index) {
            return GameItem(game: games.elementAt(index));
          },
        );
      },
    );
  }
}
