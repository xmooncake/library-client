import 'package:flutter/material.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';

import 'package:library_client/features/app/router.dart';
import 'package:library_client/features/books/books.view.dart';
import 'package:library_client/features/dashboard/dashboard.view.dart';
import 'package:library_client/features/home/components/drawer.dart';
import 'package:library_client/features/settings/settings.view.dart';

/// Works as a shell for the go_router and provides the drawer.
class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.child,
  }) : _controller = AdvancedDrawerController();

  final AdvancedDrawerController _controller;
  final Widget child;

  List<Widget> items(BuildContext context) => [
        ListTile(
          leading: const Icon(Icons.dashboard),
          title: const Text('Dashboard'),
          onTap: () => context.go(AppRouter.dashboard),
        ),
        ListTile(
          leading: const Icon(Icons.book),
          title: const Text('Books'),
          onTap: () => context.go(AppRouter.books),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () => context.go(AppRouter.settings),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeDrawerBuilder(
        _controller,
        items: items(context),
        child: child,
      ),
    );
  }
}
