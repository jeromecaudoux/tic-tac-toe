import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tictactoe/domain/entities/tic_tac_toe.dart';

part 'games_container.g.dart';

@JsonSerializable()
class GamesContainer extends Equatable {
  @JsonKey(name: 'games') //, fromJson: _gamesFromJson, toJson: _gamesToJson)
  final Map<String, TicTacToe> _games;

  GamesContainer({Map<String, TicTacToe>? games}) : _games = games ?? {};

  TicTacToe get(String id) => _games[id]!;

  void add(TicTacToe game) {
    assert(
      !_games.containsKey(game.gameId),
      'Game with id ${game.gameId} already exists.',
    );
    _games[game.gameId] = game;
  }

  void remove(String id) {
    assert(_games.containsKey(id), 'Game with id $id does not exist.');
    _games.remove(id);
  }

  void update(TicTacToe game) {
    assert(
      _games.containsKey(game.gameId),
      'Game with id ${game.gameId} does not exist.',
    );
    _games[game.gameId] = game;
  }

  Iterable<TicTacToe> get allGames => _games.values;

  @override
  List<Object?> get props => [..._games.values];

  GamesContainer copy() => GamesContainer(games: _games);

  factory GamesContainer.fromJson(dynamic json) =>
      _$GamesContainerFromJson(json);

  Map<String, dynamic> toJson() => _$GamesContainerToJson(this);
}

// Map<String, TicTacToe> _gamesFromJson(Map<String, dynamic> json) =>
//     json.map((key, value) => MapEntry(key, TicTacToe.fromJson(value)));
//
// Map<String, dynamic> _gamesToJson(Map<String, TicTacToe> games) =>
//     games.map((key, value) => MapEntry(key, value.toJson()));
