import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/player.dart';
import 'package:tictactoe/ui/home/game/board/board_item.dart';

class PlayerIcon extends ConsumerWidget {
  final Player player;
  final double size;
  final double strokeWidth;

  const PlayerIcon({
    required this.player,
    this.size = 30,
    this.strokeWidth = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: PlayerMarkPainter(player: player, strokeWidth: strokeWidth),
        child: const SizedBox.expand(),
      ),
    );
  }
}
