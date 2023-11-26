import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationOnAuthCheckRequestedEvent>((event, emit) async {
      emit(AuthenticationLoadingState());

      await Future.delayed(const Duration(seconds: 10));
      emit(AuthenticationSuccessState());
    });
  }
}
