import 'package:flutter/material.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';
import 'package:library_client/features/authentication/authentication.screen.dart';
import 'package:library_client/features/books/books.view.dart';
import 'package:library_client/features/dashboard/dashboard.view.dart';
import 'package:library_client/features/home/components/drawer.dart';
import 'package:library_client/features/settings/settings.view.dart';

class AppRouter {
  AppRouter() {
    _router = GoRouter(
      initialLocation: '/dashboard',
      routes: [
        ShellRoute(
          navigatorKey: GlobalKey<NavigatorState>(),
          builder: (context, state, child) => Scaffold(
            body: HomeDrawerBuilder(
              AdvancedDrawerController(),
              child: child,
            ),
          ),
          routes: [
            GoRoute(
              path: '/dashboard',
              name: 'dashboard',
              builder: (context, state) => const DashboardView(),
            ),
            GoRoute(
              path: '/books',
              name: 'books',
              builder: (context, state) => const BooksView(),
            ),
            GoRoute(
              path: '/settings',
              name: 'settings',
              builder: (context, state) => const SettingsView(),
            ),
          ],
        ),
        GoRoute(
          path: '/auth',
          builder: (context, state) => const AuthenticationScreen(),
        ),
      ],
      redirect: (context, state) {
        final isLoggedIn = appBloc.state is AppAuthenticatedState;
        final goingToLoginPage = state.uri.toString() == '/auth';

        if (!isLoggedIn && !goingToLoginPage) {
          return '/auth';
        }

        if (isLoggedIn && goingToLoginPage) {
          return '/dashboard';
        }

        return null;
      },
    );
  }

  static const String authentication = '/auth';

  static const String dashboard = '/dashboard';
  static const String books = '/books';
  static const String settings = '/settings';

  late final GoRouter _router;

  GoRouter get router => _router;
}
