// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'publication_manager_bloc.dart';

enum PublicationManagerStus { initial, success, failure }

class PublicationManagerState extends Equatable {
  const PublicationManagerState({
    this.status = PublicationManagerStus.initial,
    this.publication,
  });

  final PublicationManagerStus status;
  final Publication? publication;

  @override
  List<Object?> get props => [status, publication];

  PublicationManagerState copyWith({
    PublicationManagerStus? status,
    Publication? publication,
  }) {
    return PublicationManagerState(
      status: status ?? this.status,
      publication: publication ?? this.publication,
    );
  }
}
