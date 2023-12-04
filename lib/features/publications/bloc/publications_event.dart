part of 'publications_bloc.dart';

sealed class PublicationsEvent extends Equatable {
  const PublicationsEvent();

  @override
  List<Object> get props => [];
}

class PublicationsInitializedEvent extends PublicationsEvent {}

class PublicationsFetchEvent extends PublicationsEvent {}
