import 'package:flutter/material.dart';

import 'package:library_client/features/dashboard/dashboard.screen.dart';
import 'package:library_client/features/login/login.screen.dart';

//
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      // home: const CounterPage(),
    );
  }
}
