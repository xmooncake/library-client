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
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: UniqueKey(),
          onExpansionChanged: onExpansionChanged,
          title: Text(publication.title),
          initiallyExpanded: isExpanded,
          children: [
            Row(
              children: [
                Image.asset('assets/book_image.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
