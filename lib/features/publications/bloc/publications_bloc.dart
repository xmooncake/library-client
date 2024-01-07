import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

import 'package:library_client/data/models/publication.dart';
import 'package:library_client/features/publications/repositories/publications_abstr.repository.dart';
import 'package:library_client/features/publications/repositories/publications_mock.repository.dart';

part 'publications_event.dart';
part 'publications_state.dart';

class PublicationsBloc extends Bloc<PublicationsEvent, PublicationsState> {
  PublicationsBloc()
      : _publicationsRepository = MockPublicationsRepository(),
        scrollController = ScrollController(),
        searchController = TextEditingController(),
        super(const PublicationsState()) {
    on<PublicationsInitializedEvent>((event, emit) async {
      // Provides the initial fetch
      add(const PublicationsFetchEvent(isInitialFetch: true));
    });
    on<_SubscribeToListeners>((event, emit) async {
      // Listener used for lazy loading
      scrollController.addListener(() {
        if (_isBottom && !state.isFinalPage) {
          add(const PublicationsFetchEvent());
        }
      });

      // Registers the sink
      await emit.forEach<List<Publication>>(
        _publicationsRepository.publicationsStream,
        onData: (List<Publication> data) => state.copyWith(
          status: PublicationsStatus.success,
          publications: [...state.publications, ...data],
          isFinalPage: _publicationsRepository.isFinalPage,
        ),
      );
    });
    on<PublicationsFetchEvent>(transformer: throttleDroppable(),
        (event, emit) async {
      await _publicationsRepository.fetchMorePublications();

      if (event.isInitialFetch) {
        add(_SubscribeToListeners());
      }
    });
  }

  final PublicationsRepository _publicationsRepository;
  final ScrollController scrollController;
  final TextEditingController searchController;

  bool get _isBottom {
    if (!scrollController.hasClients) return false;
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  EventTransformer<E> throttleDroppable<E>() {
    return (events, mapper) {
      return droppable<E>()
          .call(events.throttle(const Duration(milliseconds: 500)), mapper);
    };
  }
}
