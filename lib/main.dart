import 'package:tictactoe/core/init.dart';
import 'package:tictactoe/domain/entities/app_config.dart';

void main() {
  init(
    AppConfig(
      boardSize: 3,
      verbose: true,
    ),
  );
}
