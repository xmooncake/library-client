import 'package:library_client/data/models/publication_type.dart';
import 'package:library_client/data/models/reservation.dart';
import 'package:library_client/data/models/review.dart';

class Publication {
  Publication({
    required this.id,
    required this.createdAt,
    required this.publicationType,
    this.reviews = const [],
    this.reservations = const [],
    //
    this.imageUrl,
    required this.title,
    required this.description,
    required this.releaseYear,
    required this.author,
    required this.pageCount,
    required this.category,
  });

  final int id;

  final DateTime createdAt;
  final PublicationType publicationType;

  final List<Reservation> reservations;
  final List<Review> reviews;

  // Publication data
  final String? imageUrl;
  final String title;
  final String description;
  final int releaseYear;
  final String author;
  final int pageCount;
  final String category;
}
