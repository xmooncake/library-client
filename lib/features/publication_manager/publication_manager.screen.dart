import 'package:flutter/material.dart';

import 'package:library_client/data/models/publication.dart';
import 'package:library_client/features/core/components/custom_text_field.dart';

class PublicationManagerScreen extends StatelessWidget {
  const PublicationManagerScreen({this.publicationId});

  final String? publicationId;

  @override
  Widget build(BuildContext context) {
    final bool isEditing = publicationId != null;

    return Scaffold(
      appBar: AppBar(
        title: isEditing
            ? const Text('Edit publication')
            : const Text('Add new publication'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Icon(Icons.add_a_photo)),
              ),
            ),
            CustomTextField(
              labelText: 'Book title',
              hintText: 'Enter book title',
            ),
            CustomTextField(
              labelText: 'Book description',
              hintText: 'Enter book description',
            ),
          ],
        ),
      ),
    );
  }
}
