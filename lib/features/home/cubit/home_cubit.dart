import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import 'package:library_client/features/books/books.view.dart';
import 'package:library_client/features/dashboard/dashboard.view.dart';
import 'package:library_client/features/settings/settings.view.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  final controller = SidebarXController(selectedIndex: 0, extended: true);

  void onItemTapped(int index) {
    controller.selectIndex(0);
  }
}
