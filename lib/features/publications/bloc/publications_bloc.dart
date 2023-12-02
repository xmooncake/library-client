import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/data/models/publication.dart';
import 'package:library_client/features/publications/repositories/publications_abstr.repository.dart';

part 'publications_event.dart';
part 'publications_state.dart';

class PublicationsBloc extends Bloc<PublicationsEvent, PublicationsState> {
  PublicationsBloc() : super(const PublicationsState()) {
    on<PublicationsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
