import 'package:flutter/material.dart';

import 'package:library_client/data/models/publication.dart';

class PublicationsCard extends StatelessWidget {
  const PublicationsCard({
    super.key,
    required this.publication,
  });

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(
                12.0,
              ),
            ), // Adjust the radius to match your card's border radius
            child: Image.asset(
              'assets/book_image.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Super ksiomżka'),
                Text('Stefan Kox'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
