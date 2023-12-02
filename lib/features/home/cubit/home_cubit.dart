import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import 'package:library_client/features/books/books.view.dart';
import 'package:library_client/features/dashboard/dashboard.view.dart';
import 'package:library_client/features/settings/settings.view.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  static const List<Widget> views = [
    DashboardView(),
    BooksView(),
    SettingsView(),
  ];

  final AdvancedDrawerController drawerController = AdvancedDrawerController();

  void goToIndex(int index) {
    emit(index);
  }

  Widget get currentView => views[state];
}
