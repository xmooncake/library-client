import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/data/models/publication.dart';

abstract class PublicationsRepositoryAbstract {
  final controller = StreamController<List<Publication>>();

  Stream<List<Publication>> get publicationsStream;

  Future<void> fetchMorePublications();

  Future<bool> createPublication(Publication publication);

  Future<bool> updatePublication(Publication publication);

  Future<bool> deletePublication(Publication publication);

  void dispose() {
    controller.close();
  }
}
