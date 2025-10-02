import 'package:json_annotation/json_annotation.dart';

enum Player {
  @JsonValue('X')
  X,
  @JsonValue('O')
  O,
  @JsonValue('none')
  none;

  String get char {
    switch (this) {
      case Player.X:
        return 'X';
      case Player.O:
        return 'O';
      case Player.none:
        return ' ';
    }
  }
}
