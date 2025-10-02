import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tictactoe/domain/entities/player.dart';

part 'board.g.dart';

@JsonSerializable()
class Board extends Equatable {
  @JsonKey(name: 'data')
  final List<List<Player>> data;

  Board({required this.data})
    : assert(data.length == data[0].length, 'Board must be square'),
      assert(data.length >= 3, 'Board must be at least 3x3');

  Board.create(int size)
    : data = List.generate(
        size,
        (_) => List.generate(size, (_) => Player.none),
      );

  int get size => data.length;

  Player at(int x, int y) => data[x][y];

  Board set(int x, int y, Player player) {
    assert(x >= 0 && x < size, 'x must be within board bounds');
    assert(y >= 0 && y < size, 'y must be within board bounds');
    assert(player != Player.none, 'player must be X or O');
    assert(at(x, y) == Player.none, 'cell is already occupied');
    data[x][y] = player;
    return this;
  }

  Player? get winner {
    // Check rows
    for (var row in data) {
      if (row.every((cell) => cell == Player.X)) return Player.X;
      if (row.every((cell) => cell == Player.O)) return Player.O;
    }

    // Check columns
    for (var col = 0; col < data.length; col++) {
      if (data.every((row) => row[col] == Player.X)) return Player.X;
      if (data.every((row) => row[col] == Player.O)) return Player.O;
    }

    // Check diagonals
    final diag1 = List.generate(data.length, (i) => data[i][i]);
    final diag2 = List.generate(
      data.length,
      (i) => data[i][data.length - 1 - i],
    );

    if (diag1.every((cell) => cell == Player.X)) return Player.X;
    if (diag1.every((cell) => cell == Player.O)) return Player.O;

    if (diag2.every((cell) => cell == Player.X)) {
      return Player.X;
    }
    if (diag2.every((cell) => cell == Player.O)) {
      return Player.O;
    }

    bool isDraw = data.every((row) => row.every((cell) => cell != Player.none));
    if (isDraw) return Player.none;
    return null;
  }

  Board copy() {
    return Board(
      data: data.map((row) => List<Player>.from(row)).toList(),
    );
  }

  factory Board.fromJson(dynamic json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);

  @override
  List<Object> get props => [data];
}
