import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/publications/bloc/publications_bloc.dart';
import 'package:library_client/features/publications/repositories/publications.mock.repository.dart';

class PublicationsView extends StatelessWidget {
  const PublicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PublicationsRepositoryMockImpl(),
      child: BlocProvider(
        create: (context) => PublicationsBloc()..add(PublicationsFetchEvent()),
        child: _PublicationsView(),
      ),
    );
  }
}

class _PublicationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PublicationsBloc, PublicationsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.publications.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        );
      },
    );
  }
}
