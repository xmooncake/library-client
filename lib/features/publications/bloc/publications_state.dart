part of 'publications_bloc.dart';

enum PublicationsStatus { initial, fetching, success, failure }

class PublicationsState extends Equatable {
  const PublicationsState({
    this.status = PublicationsStatus.initial,
    this.publications = const [],
  });

  final PublicationsStatus status;
  final List<Publication> publications;

  @override
  List<Object> get props => [status, publications];
}
