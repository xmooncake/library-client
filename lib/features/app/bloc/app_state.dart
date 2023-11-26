part of 'app_bloc.dart';

sealed class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {}

class AppAuthenticatedState extends AppState {
  const AppAuthenticatedState({
    required this.user,
  });

  final User user;
}

class AppUnauthenticatedState extends AppState {}
