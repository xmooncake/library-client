import 'package:library_client/data/models/publication.dart';
import 'package:library_client/data/models/user.dart';

class Review {
  Review({
    required this.id,
    required this.createdAt,
    required this.publication,
    required this.user,
    required this.rating,
    required this.comment,
  });

  final int id;
  final DateTime createdAt;
  final Publication publication;
  final User user;
  final int rating;
  final String comment;
}
