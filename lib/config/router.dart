import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:library_client/config/routes.dart';
import 'package:library_client/features/dashboard/home.screen.dart';

final routerConfig = GoRouter(
  initialLocation: Routes.home.path,
  routes: [
    // GoRoute(
    //   path: Routes.login.path,
    //   pageBuilder: (context, state) => LoginScreen(),
    // ),
    // GoRoute(
    //   path: Routes.loading.path,
    //   pageBuilder: (context, state) => LoadingScreen(),
    // ),
    GoRoute(
      path: Routes.home.path,
      pageBuilder: (context, state) => const MaterialPage(child: HomeScreen()),
    ),
    // GoRoute(
    //   path: Routes.settings.path,
    //   pageBuilder: (context, state) => SettingsScreen(),
    // ),
  ],
);
