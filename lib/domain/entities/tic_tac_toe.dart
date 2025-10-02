import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tictactoe/core/utils/tools.dart';
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

  factory TicTacToe.fromJson(dynamic json) => _$TicTacToeFromJson(json);

  Map<String, dynamic> toJson() => _$TicTacToeToJson(this);

  @override
  List<Object> get props => [gameId, updatedAt ?? ''];
}
