import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';
import 'package:library_client/features/authentication/authentication.screen.dart';
import 'package:library_client/features/dashboard/dashboard.view.dart';
import 'package:library_client/features/home/home.screen.dart';
import 'package:library_client/features/publication_manager/publication_manager.screen.dart';
import 'package:library_client/features/publications/publications.view.dart';
import 'package:library_client/features/settings/settings.view.dart';

class AppRouter {
  AppRouter({String? initialLocation}) {
    _router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: initialLocation ?? dashboard,
      routes: [
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => HomeScreen(child: child),
          routes: [
            GoRoute(
              path: dashboard,
              builder: (context, state) => const DashboardView(),
              redirect: (context, state) => dashboard,
            ),
            GoRoute(
              path: addPublication,
              builder: (context, state) => const PublicationManagerScreen(),
            ),
            GoRoute(
              path: publications,
              builder: (context, state) => const PublicationsView(),
              routes: [
                GoRoute(
                  path: ':id',
                  builder: (context, state) {
                    final id = state.pathParameters['id'];
                    return PublicationManagerScreen(
                      publicationId: id,
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: settings,
              builder: (context, state) => const SettingsView(),
            ),
          ],
        ),
        GoRoute(
          path: authentication,
          builder: (context, state) => const AuthenticationScreen(),
        ),
      ],
      redirect: (context, state) {
        if (initialLocation != null) return null;

        final isLoggedIn = appBloc.state is AppAuthenticatedState;
        final goingToLoginPage = state.uri.toString() == authentication;
        final isRootPath = state.uri.toString() == '/';

        if (isRootPath) {
          return isLoggedIn ? dashboard : authentication;
        }

        if (!isLoggedIn && !goingToLoginPage) {
          return authentication;
        }

        if (isLoggedIn && goingToLoginPage) {
          return dashboard;
        }

        return null;
      },
    );
  }

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  // Root routes
  static const String authentication = '/auth';

  // Shell routes
  static const String dashboard = '/dashboard';
  static const String publications = '/publications';
  static const String settings = '/settings';
  static String editPublication(int id) => '/publications/:$id';
  static const String addPublication = '/add-publication';

  late final GoRouter _router;

  GoRouter get router => _router;
}
