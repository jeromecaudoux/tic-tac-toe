import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';

class GameBoard extends ConsumerStatefulWidget {
  final TicTacToe game;

  const GameBoard({required this.game, super.key});

  @override
  ConsumerState<GameBoard> createState() => _MyGameBoardState();
}

class _MyGameBoardState extends ConsumerState<GameBoard> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
