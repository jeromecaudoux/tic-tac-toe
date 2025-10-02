import 'package:flutter/material.dart' hide YearPicker;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GamePage extends ConsumerStatefulWidget {
  final String gameId;
  const GamePage({required this.gameId, super.key});

  @override
  ConsumerState<GamePage> createState() => _MyGamePageState();
}

class _MyGamePageState extends ConsumerState<GamePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) async {
        // todo
      },
      child: Scaffold(
        body: Center(child: Text('Game Page for gameId: ${widget.gameId}')),
      ),
    );
  }
}
