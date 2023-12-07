enum PublicationType { book, magazine }

class Publication {
  Publication({
    required this.id,
    required this.publicationType,
    //
    this.imageUrl,
    required this.title,
    required this.description,
    required this.releaseYear,
    required this.authorName,
    required this.pageCount,
    //
    this.isAvailable = true,
    required this.category,
    //
    this.rating,
    this.ratingCount = 0,
    //
    required this.createdAt,
  });

  final int id;
  final PublicationType publicationType;

  final String? imageUrl;
  final String title;
  final String description;
  final int releaseYear;
  final String authorName;
  final int pageCount;

  final String category;
  final bool isAvailable;

  final double? rating;
  final int ratingCount;

  final DateTime createdAt;
}
