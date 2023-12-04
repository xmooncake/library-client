import 'package:bloc/bloc.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  final controller = SidebarXController(selectedIndex: 0, extended: true);

  void onItemTapped(int index) {
    controller.selectIndex(0);
  }
}
