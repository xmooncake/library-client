import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:library_client/data/models/user.dart';
import 'package:library_client/features/app/app.dart';
import 'package:library_client/features/app/bloc/app_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationOnAuthCheckRequestedEvent>((event, emit) async {
      emit(AuthenticationLoadingState());

      // TODO: Replace this with a real authentication check
      await Future.delayed(const Duration(seconds: 10));

      emit(AuthenticationSuccessState());

      await Future.delayed(const Duration(seconds: 1));

      // TODO: Replace this with a real user from api
      final tempUser =
          User(id: 0, name: 'Super user', email: 'email@email.email');

      appBloc.add(AppLoggedInEvent(user: tempUser));
    });
  }
}
