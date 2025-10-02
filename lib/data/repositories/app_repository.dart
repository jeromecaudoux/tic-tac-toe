import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide Threshold;
import 'package:flutter_riverpod/flutter_riverpod.dart' hide StateProvider;
import 'package:tictactoe/domain/providers/config_providers.dart';
import 'package:tictactoe/domain/entities/app_config.dart';
import 'package:tictactoe/domain/repositories/i_app_repository.dart';

final appRepProvider = Provider<IAppRepository>(
  (ref) => AppRepository(appConfig: ref.read(appConfigProvider)),
);

final initProvider = FutureProvider<void>(
  (ref) => ref.read(appRepProvider).init(),
);

class AppRepository extends IAppRepository {
  final AppConfig appConfig;
  final DateTime _startTime = DateTime.now();
  final List<String> _initSuccess = [];

  AppRepository({required this.appConfig});

  @override
  Future<bool> init() async {
    try {
      bool vb = appConfig.verbose == true;
      await Future.wait([
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]).then(_onDone(vb, 'SystemChrome')),
      ]).timeout(const Duration(seconds: 8), onTimeout: _onTimeout);
      Duration diff = DateTime.now().difference(_startTime);
      debugPrint('[Init] all done in ${diff.inMilliseconds}ms');
      return true;
    } catch (e, s) {
      debugPrint('main common failed: $e $s');
    }
    return false;
  }

  OnDone<String, T> _onDone<R, T>(bool verbose, String name) {
    return (T data) async {
      if (verbose) {
        Duration diff = DateTime.now().difference(_startTime);
        debugPrint('[Init] $name initialized in ${diff.inMilliseconds}ms');
      }
      _initSuccess.add(name);
      return name;
    };
  }

  Future<List<T>> _onTimeout<T>() async => [];
}

typedef OnDone<R, T> = Future<R> Function(T value);
