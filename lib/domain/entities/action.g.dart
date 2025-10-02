// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) => Action(
  x: (json['x'] as num).toInt(),
  y: (json['y'] as num).toInt(),
  player: $enumDecode(_$PlayerEnumMap, json['player']),
);

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
  'x': instance.x,
  'y': instance.y,
  'player': _$PlayerEnumMap[instance.player]!,
};

const _$PlayerEnumMap = {Player.X: 'X', Player.O: 'O', Player.none: 'none'};
