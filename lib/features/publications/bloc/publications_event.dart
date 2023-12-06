part of 'publications_bloc.dart';

sealed class PublicationsEvent extends Equatable {
  const PublicationsEvent();

  @override
  List<Object> get props => [];
}

class PublicationsInitializedEvent extends PublicationsEvent {}

class _SubscribeToListeners extends PublicationsEvent {}

class PublicationsFetchEvent extends PublicationsEvent {
  const PublicationsFetchEvent({this.isInitialFetch = false});

  final bool isInitialFetch;
}
