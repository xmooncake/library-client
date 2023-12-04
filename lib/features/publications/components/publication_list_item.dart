import 'package:flutter/material.dart';

import 'package:library_client/data/models/publication.dart';

class PublicationListItem extends StatelessWidget {
  const PublicationListItem({
    required this.publication,
    required this.onExpansionChanged,
    this.isExpanded = false,
  });

  final Function(bool value) onExpansionChanged;
  final bool isExpanded;
  final Publication publication;

  @override
  Widget build(BuildContext context) {
    Padding tileDataRow({
      required String title,
      required Widget item,
      // double padding = 5,
    }) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            item,
          ],
        ),
      );
    }

    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: UniqueKey(),
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.leading,
          title: const SizedBox(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
          initiallyExpanded: isExpanded,
        ),
      ),
    );
  }
}
