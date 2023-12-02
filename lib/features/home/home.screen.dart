import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/home/components/drawer.dart';
import 'package:library_client/features/home/cubit/home_cubit.dart';

/// Works as a shell for the go_router and provides the drawer.
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HomeDrawer(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
