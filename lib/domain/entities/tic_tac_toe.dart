import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/domain/entities/action.dart';
import 'package:tictactoe/domain/entities/board.dart';
import 'package:tictactoe/domain/entities/player.dart';

part 'tic_tac_toe.g.dart';

@JsonSerializable()
class TicTacToe extends Equatable {
  static const String collection = 'answers';

  @JsonKey(name: 'id')
  final String gameId;
  @JsonKey(name: 'board')
  final Board board;
  @JsonKey(name: 'player')
  final Player player;
  @JsonKey(
    name: 'createdAt',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  final DateTime? createdAt;
  @JsonKey(
    name: 'updatedAt',
    fromJson: dateTimeFromJson,
    toJson: dateTimeToJson,
  )
  final DateTime? updatedAt;

  TicTacToe.create({required this.gameId, required int boardSize})
    : createdAt = DateTime.now(),
      board = Board.create(boardSize),
      player = Player.none,
      updatedAt = DateTime.now();

  const TicTacToe({
    required this.gameId,
    required this.board,
    required this.player,
    required this.createdAt,
    required this.updatedAt,
  });

  Player get nextPlayer {
    switch (player) {
      case Player.X:
        return Player.O;
      case Player.O:
        return Player.X;
      case Player.none:
        return Player.values[Random().nextInt(2)];
    }
  }

  factory TicTacToe.fromJson(dynamic json) => _$TicTacToeFromJson(json);

  Map<String, dynamic> toJson() => _$TicTacToeToJson(this);

  @override
  List<Object> get props => [gameId, updatedAt ?? ''];

  bool get isGameOver => board.winner != null;

  TicTacToe play(Action action) {
    return copyWith(
      updatedAt: DateTime.now(),
      player: action.player,
      board: board.copy().set(action.x, action.y, action.player),
    );
  }

  TicTacToe copyWith({
    Board? board,
    Player? player,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return TicTacToe(
      gameId: gameId,
      board: board ?? this.board,
      player: player ?? this.player,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
