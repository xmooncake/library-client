import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/home/components/drawer.dart';
import 'package:library_client/features/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const _HomeScreenView(),
    );
  }
}

class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeCubit>().drawerController;

    return BlocProvider(
      create: (_) => HomeCubit(),
      child: HomeDrawerBulder(
        controller: controller,
        items: HomeCubit.views,
        child: Scaffold(
          appBar: AppBar(
            leading: HomeDrawerBulder.drawerButton(controller),
          ),
          body: BlocBuilder<HomeCubit, int>(
            builder: (_, state) => HomeCubit.views[state],
          ),
        ),
      ),
    );
  }
}
