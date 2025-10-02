// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tic_tac_toe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicTacToe _$TicTacToeFromJson(Map<String, dynamic> json) => TicTacToe(
  gameId: json['id'] as String,
  board: Board.fromJson(json['board']),
  player: $enumDecode(_$PlayerEnumMap, json['player']),
  createdAt: dateTimeFromJson(json['createdAt']),
  updatedAt: dateTimeFromJson(json['updatedAt']),
);

Map<String, dynamic> _$TicTacToeToJson(TicTacToe instance) => <String, dynamic>{
  'id': instance.gameId,
  'board': instance.board,
  'player': _$PlayerEnumMap[instance.player]!,
  'createdAt': dateTimeToJson(instance.createdAt),
  'updatedAt': dateTimeToJson(instance.updatedAt),
};

const _$PlayerEnumMap = {Player.X: 'X', Player.O: 'O', Player.none: 'none'};
