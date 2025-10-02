// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig(
  boardSize: (json['boardSize'] as num).toInt(),
  verbose: json['verbose'] as bool?,
);

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
  if (instance.verbose case final value?) 'verbose': value,
  'boardSize': instance.boardSize,
};
