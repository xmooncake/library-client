import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:library_client/features/app/bloc/app_bloc.dart';
import 'package:library_client/features/home/home.screen.dart';

class AppRouter {
  AppRouter(BuildContext context) {
    final appBloc = BlocProvider.of<AppBloc>(context);

    _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        // GoRoute(
        //   path: '/login',
        //   builder: (context, state) => (),
        // ),
      ],
      redirect: (context, state) {
        final isLoggedIn = appBloc.state is AppAuthenticatedState;
        final goingToLoginPage = state.uri.toString() == '/login';

        if (!isLoggedIn && !goingToLoginPage) {
          return '/login';
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
