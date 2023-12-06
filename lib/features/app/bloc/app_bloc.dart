import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

import 'package:library_client/data/models/user.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitialState()) {
    on<AppLoggedInEvent>(
      (event, emit) {
        emit(AppAuthenticatedState(user: event.user));

        router.go('/');
      },
    );
    on<AppLoggedOutEvent>((event, emit) {
      router.go('/login');
      emit(AppUnauthenticatedState());
    });
  }

  late GoRouter router;
}
