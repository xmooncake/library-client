part of 'publications_bloc.dart';

sealed class PublicationsEvent extends Equatable {
  const PublicationsEvent();

  @override
  List<Object> get props => [];
}

class PublicationsFetchEvent extends PublicationsEvent {}
