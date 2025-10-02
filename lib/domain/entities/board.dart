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

  factory Board.fromJson(dynamic json) => _$BoardFromJson(json);

  Map<String, dynamic> toJson() => _$BoardToJson(this);

  @override
  List<Object> get props => [data];
}
