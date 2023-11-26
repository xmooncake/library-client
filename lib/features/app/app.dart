import 'package:flutter/material.dart';


import 'package:go_router/go_router.dart';

import 'package:library_client/config/router.dart';
import 'package:library_client/features/dashboard/home.screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routerConfig: routerConfig,
    );
  }
}
