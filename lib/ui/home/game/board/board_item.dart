import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/utils/app_toast.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/domain/entities/player.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';
import 'package:tictactoe/domain/providers/games_container_provider.dart';

typedef OnBoardItemTap = void Function(int x, int y);

class BoardItem extends ConsumerStatefulWidget {
  final OnBoardItemTap? onTap;
  final TicTacToe game;
  final int x;
  final int y;

  const BoardItem({
    required this.onTap,
    required this.game,
    required this.x,
    required this.y,
    super.key,
  });

  @override
  ConsumerState<BoardItem> createState() => _MyBoardItemState();
}

class _MyBoardItemState extends ConsumerState<BoardItem> {
  @override
  Widget build(BuildContext context) {
    final Player player = ref.watch(
      gamesContainerProvider.select(
        (container) =>
            container.get(widget.game.gameId).board.at(widget.x, widget.y),
      ),
    );
    return GestureDetector(
      onTap: widget.onTap == null ? null : () => _onTap(player, context),
      child: Container(
        color: Colors.grey[300],
        child: CustomPaint(
          painter: PlayerMarkPainter(player: player),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }

  void _onTap(Player player, BuildContext context) {
    if (player == Player.none) {
      widget.onTap?.call(widget.x, widget.y);
    } else {
      showAppToast(I18n.of(context).boardItemAlreadyPlayed);
    }
  }
}

class PlayerMarkPainter extends CustomPainter {
  PlayerMarkPainter({
    required this.player,
    this.xColor = const Color(0xFFEF5350), // red-ish
    this.oColor = const Color(0xFF42A5F5), // blue-ish
    this.noneColor = Colors.transparent,
    this.strokeWidth = 8.0,
    this.strokeCap = StrokeCap.round,
    this.antiAlias = true,
  });

  final Player player;
  final Color xColor;
  final Color oColor;
  final Color noneColor;
  final double strokeWidth;
  final StrokeCap strokeCap;
  final bool antiAlias;

  @override
  void paint(Canvas canvas, Size size) {
    // Guard: nothing to draw for Player.none
    if (player == Player.none) {
      if (noneColor != Colors.transparent) {
        final p = Paint()
          ..color = noneColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = antiAlias;
        canvas.drawRect(Offset.zero & size, p);
      }
      return;
    }

    // Use min dimension to keep mark perfectly centered & proportional.
    final s = size.shortestSide;
    final center = Offset(size.width / 2, size.height / 2);

    // Common paint
    final paint = Paint()
      ..color = (player == Player.X) ? xColor : oColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = strokeCap
      ..isAntiAlias = antiAlias;

    // A small inset to avoid clipping on edges with thick strokes
    final inset = strokeWidth * 0.75;
    final half = s / 2 - inset;

    if (player == Player.X) {
      // Draw two diagonals to form an "X"
      // From top-left to bottom-right
      canvas.drawLine(
        Offset(center.dx - half, center.dy - half),
        Offset(center.dx + half, center.dy + half),
        paint,
      );
      // From bottom-left to top-right
      canvas.drawLine(
        Offset(center.dx - half, center.dy + half),
        Offset(center.dx + half, center.dy - half),
        paint,
      );
    } else if (player == Player.O) {
      // Draw an "O" as a circle
      final radius = half;
      canvas.drawCircle(center, radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant PlayerMarkPainter oldDelegate) {
    // Repaint only when relevant properties change
    return oldDelegate.player != player ||
        oldDelegate.xColor != xColor ||
        oldDelegate.oColor != oColor ||
        oldDelegate.noneColor != noneColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.strokeCap != strokeCap ||
        oldDelegate.antiAlias != antiAlias;
  }
}
