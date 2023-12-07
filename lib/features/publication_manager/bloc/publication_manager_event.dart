part of 'publication_manager_bloc.dart';

sealed class PublicationManagerEvent extends Equatable {
  const PublicationManagerEvent();

  @override
  List<Object> get props => [];
}

class PublicationManagerInitializedEvent extends PublicationManagerEvent {
  const PublicationManagerInitializedEvent({
    this.publicationId,
  });

  final String? publicationId;
}

class PublicationManagerChangesSavedEvent extends PublicationManagerEvent {
  const PublicationManagerChangesSavedEvent();

  // final Publication publication;
}

class PublicationManagerOnSelectImageEvent extends PublicationManagerEvent {
  const PublicationManagerOnSelectImageEvent();
}
