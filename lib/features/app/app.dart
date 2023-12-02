import 'package:flutter/material.dart';

import 'package:library_client/features/app/bloc/app_bloc.dart';
import 'package:library_client/features/app/router.dart';

final appBloc = AppBloc();

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;
    appBloc.router = router;

    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routerConfig: router,
    );
  }
}
