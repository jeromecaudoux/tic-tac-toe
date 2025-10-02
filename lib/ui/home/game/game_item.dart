import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/router/router.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/data/repositories/games_repository.dart';
import 'package:tictactoe/domain/entities/player.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/ui/home/game/player_icon.dart';

class GameItem extends ConsumerWidget {
  final TicTacToe game;

  const GameItem({
    required this.game,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String fiveCharsHash = game.hashCode
        .toString()
        .padLeft(5, '0')
        .substring(0, 5);
    return Dismissible(
      key: ValueKey(game.gameId),
      onDismissed: (direction) => _onDelete(context, ref),
      confirmDismiss: (_) => _confirmDismiss(context),
      background: Container(
        color: Theme.of(context).colorScheme.errorContainer,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: space.normal),
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
      ),
      child: ListTile(
        title: Text(I18n.of(context).game(fiveCharsHash)),
        subtitle: _buildSubtitle(context),
        onTap: () {
          context.push(
            Routes.game.build(path: {'id': game.gameId}),
          );
        },
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    Widget subtitle;
    Player? winner = game.board.winner;
    if (winner != null) {
      subtitle = _buildWInner(context, winner);
    } else {
      subtitle = Row(
        children: [
          Text(I18n.of(context).playerTurn),
          const SizedBox(width: space.half),
          PlayerIcon(player: game.nextPlayer, size: 20, strokeWidth: 3),
        ],
      );
    }
    return subtitle;
  }

  Text _buildWInner(BuildContext context, Player winner) {
    if (winner == Player.none) {
      return Text(I18n.of(context).itsDraw);
    }
    return Text.rich(
      TextSpan(
        text: I18n.of(context).player,
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: space.half),
              child: PlayerIcon(
                player: winner,
                size: 20,
                strokeWidth: 3,
              ),
            ),
          ),
          TextSpan(text: I18n.of(context).won),
        ],
      ),
    );
  }

  Future<void> _onDelete(BuildContext context, WidgetRef ref) async {
    try {
      await ref.read(gamesRepProvider).delete(game.gameId);
      debugPrint('Deleted game: ${game.gameId}');
    } catch (e, s) {
      debugPrint('Failed to delete game: $e, $s');
      if (context.mounted) {
        showAppToast(getMessage(context, e));
      }
    }
  }

  Future<bool?> _confirmDismiss(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(I18n.of(context).deleteGameTitle),
          content: Text(I18n.of(context).deleteGameText),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(I18n.of(context).cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(I18n.of(context).delete),
            ),
          ],
        );
      },
    );
  }
}
