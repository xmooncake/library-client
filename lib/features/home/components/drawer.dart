import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';
import 'package:library_client/features/app/router.dart';
import 'package:library_client/features/core/components/user_avatar.dart';
import 'package:library_client/features/home/cubit/home_cubit.dart';

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: context.read<HomeCubit>().controller,
      theme: sideBarTheme(),
      extendedTheme: sideBarExpandedTheme(),
      showToggleButton: false,
      headerBuilder: (context, extended) {
        return UserAvatarWidget(
          user: (appBloc.state as AppAuthenticatedState).user,
          showUsername: extended,
        );
      },
      items: [
        SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
          onTap: () => context.go(AppRouter.dashboard),
        ),
        SidebarXItem(
          icon: Icons.add,
          label: 'Add publication',
          onTap: () => context.go(AppRouter.addPublication),
        ),
        SidebarXItem(
          icon: Icons.book,
          label: 'Publications',
          onTap: () => context.go(AppRouter.publications),
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () => context.go(AppRouter.settings),
        ),
      ],
      footerItems: [
        SidebarXItem(
          icon: Icons.logout,
          label: 'Logout',
          onTap: () => appBloc.add(AppLoggedOutEvent()),
        ),
        SidebarXItem(
          icon: Icons.power_settings_new,
          label: 'Exit',
          onTap: () => exit(0),
        ),
      ],
    );
  }

  SidebarXTheme sideBarExpandedTheme() {
    return const SidebarXTheme(
      width: 200,
      decoration: BoxDecoration(
        color: canvasColor,
      ),
    );
  }

  SidebarXTheme sideBarTheme() {
    return SidebarXTheme(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: canvasColor,
        borderRadius: BorderRadius.circular(20),
      ),
      hoverColor: scaffoldBackgroundColor,
      textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
      selectedTextStyle: const TextStyle(color: Colors.white),
      itemTextPadding: const EdgeInsets.only(left: 20),
      selectedItemTextPadding: const EdgeInsets.only(left: 20),
      itemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: canvasColor),
      ),
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: actionColor.withOpacity(0.37),
        ),
        gradient: const LinearGradient(
          colors: [accentCanvasColor, canvasColor],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.28),
            blurRadius: 30,
          ),
        ],
      ),
      iconTheme: IconThemeData(
        color: Colors.white.withOpacity(0.7),
        size: 20,
      ),
      selectedIconTheme: const IconThemeData(
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
