import 'package:flutter/material.dart';

import 'package:searchfield/searchfield.dart';

class PublicationsSearchCard extends StatelessWidget {
  const PublicationsSearchCard({
    required this.searchController,
    required this.onSubmit,
    required this.onCancel,
    super.key,
  });

  final TextEditingController searchController;
  final void Function(String)? onSubmit;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.7,
      child: Card(
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: SearchField(
                autoCorrect: false,
                searchInputDecoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Szukaj publikacji',
                ),
                controller: searchController,
                suggestions: const [],
                onSubmit: onSubmit,
              ),
            ),
            IconButton(
              onPressed: onCancel,
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
