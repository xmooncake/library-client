// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:library_client/data/models/publication.dart';

abstract class PublicationsRepository {
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
