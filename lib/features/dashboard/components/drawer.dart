import 'package:flutter/material.dart';

import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.screens});

  final List<Widget> screens;

  ScreenHiddenDrawer menuItem(String title, Widget screen) {
    return ScreenHiddenDrawer(
      ItemHiddenMenu(
        name: title,
        baseStyle: const TextStyle(),
        selectedStyle: const TextStyle(),
      ),
      screen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: [
        ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Dashboard',
            baseStyle: const TextStyle(),
            selectedStyle: const TextStyle(),
          ),
          screens[0],
        ),
      ],
      backgroundColorMenu: Theme.of(context).primaryColor,
    );
  }
}
