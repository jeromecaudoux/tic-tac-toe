import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig extends Equatable {
  @JsonKey(name: 'verbose')
  final bool? verbose;
  @JsonKey(name: 'boardSize')
  final int boardSize;

  const AppConfig({required this.boardSize, this.verbose});

  const AppConfig.none() : this(boardSize: 3, verbose: false);

  factory AppConfig.fromJson(dynamic json) => _$AppConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AppConfigToJson(this);

  @override
  List<Object> get props => [boardSize, verbose ?? false];
}

enum Flavor { prod, dev }
