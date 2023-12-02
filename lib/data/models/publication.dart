enum PublicationType { book, magazine }

class Publication {
  Publication({
    required this.id,
    this.imageUrl,
    required this.title,
    required this.description,
    required this.releaseYear,
    required this.publicationType,
    this.rating,
    this.ratingCount = 0,
    required this.createdAt,
  });

  final int id;

  final String? imageUrl;
  final String title;
  final String description;
  final int releaseYear;

  final PublicationType publicationType;

  final double? rating;
  final int ratingCount;

  final DateTime createdAt;
}
