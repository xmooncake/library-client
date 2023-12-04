import 'package:library_client/data/models/publication.dart';
import 'package:library_client/features/publications/repositories/publications_abstr.repository.dart';

class PublicationsRepositoryMockImpl extends PublicationsRepositoryAbstract {
  PublicationsRepositoryMockImpl() : super();

  // Generating a list of 20 mock publications
  final List<Publication> _publications = List.generate(
    20,
    (index) => Publication(
      id: index,
      title: 'Super Book $index',
      description: 'A compelling read, full of intriguing twists and turns.',
      releaseYear: 2000 + index,
      publicationType: PublicationType.book, // Or magazine, based on your logic
      createdAt: DateTime.now().subtract(Duration(days: index * 30)),
      rating: (index % 5) + 1.0, // Mock rating between 1.0 to 5.0
      ratingCount: (index * 10) + 5, // Mock rating count between 5
    ),
  );

  @override
  Future<void> fetchMorePublications() async {
    await Future.delayed(const Duration(seconds: 5));

    super.controller.sink.add(_publications);
  }

  @override
  // TODO: implement publicationsStream
  Stream<List<Publication>> get publicationsStream => super.controller.stream;

  @override
  Future<bool> createPublication(Publication publication) {
    // TODO: implement createPublication
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
