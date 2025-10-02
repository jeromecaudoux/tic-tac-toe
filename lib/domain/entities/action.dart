import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tictactoe/domain/entities/player.dart';

part 'action.g.dart';

@JsonSerializable()
class Action extends Equatable {
  @JsonKey(name: 'x')
  final int x;
  @JsonKey(name: 'y')
  final int y;
  @JsonKey(name: 'player')
  final Player player;

  const Action({required this.x, required this.y, required this.player})
    : assert(x >= 0, 'x must be non-negative'),
      assert(y >= 0, 'y must be non-negative');

  factory Action.fromJson(dynamic json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);

  @override
  List<Object> get props => [x, y, player];
}
