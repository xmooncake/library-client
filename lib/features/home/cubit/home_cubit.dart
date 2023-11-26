import 'package:flutter/widgets.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeCubit extends Cubit<int> {

  HomeCubit() : super(0);
  static const List<Widget> views = [];

  final AdvancedDrawerController drawerController = AdvancedDrawerController();

  void goToIndex(int index) {
    emit(index);
  }

  Widget get currentView => views[state];
}
