import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitialState()) {
    on<AppLoggedInEvent>((event, emit) => emit(AppAuthenticatedState()));
    on<AppLoggedOutEvent>((event, emit) => emit(AppUnauthenticatedState()));
  }
}
