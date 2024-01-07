import 'package:library_client/data/api_provider.dart';
import 'package:library_client/data/models/publication.dart';
import 'package:library_client/data/models/publication_type.dart';
import 'package:library_client/features/publications/repositories/publications.repository.dart';

class MockPublicationsRepository extends PublicationsRepository {
  MockPublicationsRepository() : super();

  // Generating a list of 20 mock publications with funny details
  final List<Publication> _publications = List.generate(
    20,
    (index) => Publication(
      id: index,
      title: 'Super Book $index: The Adventures of an Overcaffeinated Squirrel',
      description:
          'Dive into the hilarious escapades of a squirrel with an espresso addiction, navigating through a world of nutty mysteries and high-stakes acorn heists.',
      releaseYear: 2000 + index,
      author: 'Jane Doughnut',
      pageCount: 200 + index,
      category: 'Comedy-Adventure',
      publicationType: PublicationType.book, // Or magazine, based on your logic
      createdAt: DateTime.now().subtract(Duration(days: index * 30)),
    ),
  );

  @override
  Future<void> fetchMorePublications() async {
    await Future.delayed(const Duration(seconds: 1));

    super.controller.sink.add(_publications);
  }

  @override
  // TODO: implement publicationsStream
  Stream<List<Publication>> get publicationsStream => super.controller.stream;

  @override
  Future<bool> createPublication(Publication publication) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePublication(Publication publication) {
    // TODO: implement deletePublication
    throw UnimplementedError();
  }

  @override
  Future<bool> updatePublication(Publication publication) {
    // TODO: implement updatePublication
    throw UnimplementedError();
  }
}
