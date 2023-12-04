import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/core/error/data_empty.widget.dart';
import 'package:library_client/features/core/error/data_failed.widget.dart';
import 'package:library_client/features/publications/bloc/publications_bloc.dart';
import 'package:library_client/features/publications/components/bottom_loader.dart';
import 'package:library_client/features/publications/components/publication_list_item.dart';
import 'package:library_client/features/publications/components/search_card.dart';

class PublicationsView extends StatelessWidget {
  const PublicationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PublicationsBloc()..add(PublicationsInitializedEvent()),
      child: _PublicationsView(),
    );
  }
}

class _PublicationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          PublicationsSearchCard(
            searchController: context.read<PublicationsBloc>().searchController,
            onSubmit: null,
            onCancel: () {},
          ),
          const Expanded(child: PublicationsList()),
        ],
      ),
    );
  }
}

class PublicationsList extends StatelessWidget {
  const PublicationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Requires better soulution
    // Workaround to achieve closing previous tile upon selecting another
    // https://stackoverflow.com/questions/72315755/close-an-expansiontile-when-another-expansiontile-is-tapped
    int selectedTile = -1;

    return BlocBuilder<PublicationsBloc, PublicationsState>(
      builder: (context, state) {
        switch (state.status) {
          case PublicationsStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case PublicationsStatus.empty:
            return const DataEmptyWidget();
          case PublicationsStatus.failure:
            return const DataFailedWidget();
          case PublicationsStatus.success:
            if (state.publications.isEmpty) {
              return const DataEmptyWidget();
            }

            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.publications.length
                    ? const BottomLoader()
                    : PublicationListItem(
                        isExpanded: index == selectedTile,
                        onExpansionChanged: (value) {
                          if (value) {
                            selectedTile = index;
                          } else {
                            selectedTile = -1;
                          }
                        },
                        publication: state.publications[index],
                      );
              },
              itemCount: state.isFinalPage
                  ? state.publications.length
                  : state.publications.length + 1,
              controller: context.read<PublicationsBloc>().scrollController,
            );
        }
      },
    );
  }
}
