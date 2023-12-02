import 'package:flutter/material.dart';

import 'package:library_client/bootstrap.dart';
import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/settings/settings.view.dart';

void main() {
  // Hard code tokeeny itp

  bootstrap(() => const App());
  // bootstrap(() => const MaterialApp(home: Scaffold(body: SettingsView())));0
}
