import 'package:flutter/material.dart';

import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/publications/bloc/publications_bloc.dart';
import 'package:library_client/features/publications/components/bottom_loader.dart';
import 'package:library_client/features/publications/components/fab.dart';
import 'package:library_client/features/publications/components/publications_card.dart';
import 'package:library_client/features/publications/components/search_card.dart';
import 'package:library_client/features/shared/error/data_empty.widget.dart';
import 'package:library_client/features/shared/error/data_failed.widget.dart';

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

            return AutoHeightGridView(
              itemCount: state.isFinalPage
                  ? state.publications.length
                  : state.publications.length + 1,
              controller: context.read<PublicationsBloc>().scrollController,
              crossAxisCount: 3,
              padding: const EdgeInsets.all(12),
              builder: (context, index) {
                return index >= state.publications.length
                    ? const Center(child: BottomLoader())
                    : PublicationsCard(
                        publication: state.publications[index],
                      );
              },
            );

          // return GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 3, // Adjust the number of columns as needed
          //   ),
          //   physics: const AlwaysScrollableScrollPhysics(),
          //   // itemExtent: 200,
          //   itemBuilder: (BuildContext context, int index) {
          //     return index >= state.publications.length
          //         ? const Center(child: BottomLoader())
          //         : publicationsExpansionCard();
          //   },
          //   itemCount: state.isFinalPage
          //       ? state.publications.length
          //       : state.publications.length + 1,
          //   controller: context.read<PublicationsBloc>().scrollController,
          // );
        }
      },
    );
  }
}
