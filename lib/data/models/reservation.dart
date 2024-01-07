import 'package:library_client/data/models/publication.dart';
import 'package:library_client/data/models/user.dart';

class Reservation {
  Reservation({
    required this.id,
    required this.createdAt,
    required this.publication,
    required this.user,
  });

  final int id;
  final DateTime createdAt;
  final Publication publication;
  final User user;
}
