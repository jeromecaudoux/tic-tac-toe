// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Board _$BoardFromJson(Map<String, dynamic> json) => Board(
  data: (json['data'] as List<dynamic>)
      .map(
        (e) => (e as List<dynamic>)
            .map((e) => $enumDecode(_$PlayerEnumMap, e))
            .toList(),
      )
      .toList(),
);

Map<String, dynamic> _$BoardToJson(Board instance) => <String, dynamic>{
  'data': instance.data
      .map((e) => e.map((e) => _$PlayerEnumMap[e]!).toList())
      .toList(),
};

const _$PlayerEnumMap = {Player.X: 'X', Player.O: 'O', Player.none: 'none'};
