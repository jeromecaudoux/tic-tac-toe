import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tictactoe/core/utils/dimens.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/domain/entities/player.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/ui/home/game/player_icon.dart';

class GameOverOverlay extends ConsumerWidget {
  final TicTacToe game;

  const GameOverOverlay({required this.game, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Player? winner = game.board.winner;
    return Positioned.fill(
      child: Container(
        color: Colors.black.withValues(alpha: 0.7),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (winner == Player.none)
                _buildDraw(context)
              else
                _buildPLayerWin(context, winner),
              const SizedBox(height: space.normal),
              ElevatedButton(
                onPressed: context.pop,
                child: Text(I18n.of(context).exit),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraw(BuildContext context) {
    return Text(
      I18n.of(context).itsDraw,
      style: TextStyle(
        fontSize: text.h2,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildPLayerWin(BuildContext context, Player? winner) {
    return Text.rich(
      TextSpan(
        text: I18n.of(context).player,
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: space.half),
              child: PlayerIcon(player: winner!),
            ),
          ),
          TextSpan(text: I18n.of(context).won),
        ],
      ),
      style: TextStyle(
        fontSize: text.h2,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
