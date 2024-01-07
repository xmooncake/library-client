import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/core/error/data_empty.widget.dart';
import 'package:library_client/features/core/error/data_failed.widget.dart';
import 'package:library_client/features/publications/bloc/publications_bloc.dart';
import 'package:library_client/features/publications/components/bottom_loader.dart';
import 'package:library_client/features/publications/components/custom_expansion_tile.dart';
import 'package:library_client/features/publications/components/fab.dart';
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
      child: Stack(
        children: [
          Column(
            children: [
              PublicationsSearchCard(
                searchController:
                    context.read<PublicationsBloc>().searchController,
                onSubmit: null,
                onCancel: () {},
              ),
              const Expanded(child: PublicationsGrid()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: PublicationsFab(),
            ),
          ),
        ],
      ),
    );
  }
}

class PublicationsGrid extends StatelessWidget {
  const PublicationsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 500,
            child: CustomExpansionTileCard(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(
                        12.0,
                      ),
                    ), // Adjust the radius to match your card's border radius
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.asset(
                          'assets/book_image.png',
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Super ksiomżka'),
                      Text('Sumper autor'),
                    ],
                  ),
                ],
              ),
              children: const [
                Text('dkaosd'),
                Text('asidjao'),
                Text('asidjao'),
                Text('asidjao'),
                Text('asidjao'),
              ],
            ),
          ),
        ],
      ),
    );

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
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 3, // Adjust the number of columns as needed
              // ),
              physics: const AlwaysScrollableScrollPhysics(),
              // itemExtent: 200,
              itemBuilder: (BuildContext context, int index) {
                return index >= state.publications.length
                    ? const Center(child: BottomLoader())
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
