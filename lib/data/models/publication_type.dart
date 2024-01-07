enum PublicationType { book, magazine }

extension PublicationTypeExtension on PublicationType {
  String get name {
    switch (this) {
      case PublicationType.book:
        return 'Książka';
      case PublicationType.magazine:
        return 'Magazyn';
    }
  }
}
