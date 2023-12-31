import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';
import 'package:library_client/features/authentication/authentication.screen.dart';
import 'package:library_client/features/home/home.screen.dart';

class AppRouter {
  AppRouter() {
    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
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
          return '/';
        }

        return null;
      },
    );
  }

  late final GoRouter _router;

  GoRouter get router => _router;
}
