import 'dart:async';

import 'package:library_client/data/models/publication.dart';

abstract class PublicationsRepositoryAbstract {
  final controller = StreamController<List<Publication>>();

  bool isFinalPage = false;

  Stream<List<Publication>> get publicationsStream;

  Future<void> fetchMorePublications();

  Future<bool> createPublication(Publication publication);

  Future<bool> updatePublication(Publication publication);

  Future<bool> deletePublication(Publication publication);

  void dispose() {
    controller.close();
  }
}
