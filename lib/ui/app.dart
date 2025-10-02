import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tictactoe/core/router/router.dart';
import 'package:tictactoe/core/utils/i18n.dart';
import 'package:tictactoe/core/utils/tools.dart';
import 'package:tictactoe/data/repositories/app_repository.dart';
import 'package:tictactoe/ui/theme/theme.dart';
import 'package:oktoast/oktoast.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final init = ref.watch(initProvider);
    return init.when(
      data: (_) {
        debugPrint('[App] init data');
        return _root(context, ref);
      },
      loading: () {
        debugPrint('[App] init loading');
        return Center(child: const CircularProgressIndicator());
      },
      error: (_, __) {
        debugPrint('[App] init error');
        return _root(context, ref);
      },
    );
  }

  Widget _root(BuildContext context, WidgetRef ref) {
    return OKToast(
      child: MaterialApp.router(
        localizationsDelegates: I18n.localizationsDelegates,
        supportedLocales: I18n.supportedLocales,
        theme: AppTheme.light(context),
        darkTheme: AppTheme.dark(context),
        themeAnimationDuration: transitionDuration,
        themeAnimationCurve: Curves.ease,
        routerConfig: ref.read(goRouterProvider).build(),
      ),
    );
  }
}
