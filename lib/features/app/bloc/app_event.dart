part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLoggedInEvent extends AppEvent {
  const AppLoggedInEvent({
    required this.user,
  });

  final User user;
}

class AppLoggedOutEvent extends AppEvent {}
