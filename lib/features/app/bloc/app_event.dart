part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppLoggedInEvent extends AppEvent {}

class AppLoggedOutEvent extends AppEvent {}
