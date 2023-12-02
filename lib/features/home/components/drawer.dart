import 'package:flutter/material.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';

import 'package:library_client/features/home/components/user_card.dart';

class HomeDrawerBuilder extends StatelessWidget {
  const HomeDrawerBuilder(
    this.controller, {
    super.key,
    this.openRatio = 0.4,
    required this.items,
    required this.child,
  });

  final AdvancedDrawerController controller;
  final double openRatio;
  final List<Widget> items;
  final Widget child;

  static IconButton drawerButton(AdvancedDrawerController controller) =>
      IconButton(
        onPressed: () => controller.toggleDrawer(),
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: controller,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Icon(
                value.visible ? Icons.clear : Icons.menu,
                key: ValueKey<bool>(value.visible),
              ),
            );
          },
        ),
      );

  Container get backdrop => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: backdrop,
      openRatio: openRatio,
      controller: controller,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Column(
          children: [
            const UserCard(),
            ...items,
          ],
        ),
      ),
      child: child,
    );
  }
}
