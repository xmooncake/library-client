// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'publications_bloc.dart';

enum PublicationsStatus { initial, success, empty, failure }

class PublicationsState extends Equatable {
  const PublicationsState({
    this.status = PublicationsStatus.initial,
    this.publications = const [],
    this.isFinalPage = false,
  });

  final PublicationsStatus status;
  final List<Publication> publications;
  final bool isFinalPage;

  @override
  List<Object> get props => [status, publications, isFinalPage];

  PublicationsState copyWith({
    PublicationsStatus? status,
    List<Publication>? publications,
    bool? isFinalPage,
  }) {
    return PublicationsState(
      status: status ?? this.status,
      publications: publications ?? this.publications,
      isFinalPage: isFinalPage ?? this.isFinalPage,
    );
  }
}
