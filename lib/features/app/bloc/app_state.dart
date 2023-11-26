part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {}

class AppAuthenticatedState extends AppState {}

class AppUnauthenticatedState extends AppState {}
