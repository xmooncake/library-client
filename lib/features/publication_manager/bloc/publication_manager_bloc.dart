import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:library_client/data/models/publication.dart';

part 'publication_manager_event.dart';
part 'publication_manager_state.dart';

class PublicationManagerBloc
    extends Bloc<PublicationManagerEvent, PublicationManagerState> {
  PublicationManagerBloc() : super(const PublicationManagerState()) {
    on<PublicationManagerInitializedEvent>((event, emit) {
      if (event.publicationId != null) {
        _isEditing = true;

        // TODO: fetch publication from API
        // Temp implementation:

        final publication = Publication(
          id: event.publicationId! as int,
          title: 'Publication title',
          description: 'Publication description',
          authorName: 'John Doe',
          category: 'Thriller',
          pageCount: 200,
          releaseYear: 2021,
          publicationType: PublicationType.book,
          createdAt: DateTime.now(),
        );

        emit(
          state.copyWith(
            status: PublicationManagerStus.success,
            publication: publication,
          ),
        );
      } else {
        emit(state.copyWith(status: PublicationManagerStus.success));
      }
    });
    on<PublicationManagerChangesSavedEvent>((event, emit) {
      // TODO: save changes to API or add new publication and emit success/error state
    });
    on<PublicationManagerOnSelectImageEvent>((event, emit) {});
  }

  bool _isEditing = false;
}
