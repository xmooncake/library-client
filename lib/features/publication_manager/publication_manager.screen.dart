import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/shared/components/custom_text_field.dart';
import 'package:library_client/features/publication_manager/bloc/publication_manager_bloc.dart';
import 'package:library_client/features/publication_manager/components/image_picker.dart';
import 'package:library_client/features/publication_manager/components/section.dart';

class PublicationManagerScreen extends StatelessWidget {
  const PublicationManagerScreen({this.publicationId});

  final String? publicationId;

  @override
  Widget build(BuildContext context) {
    final bool isEditing = publicationId != null;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: isEditing
            ? const Text('Edit publication')
            : const Text('Add new publication'),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: size.width * 0.15,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
              onPressed: () => context
                  .read<PublicationManagerBloc>()
                  .add(const PublicationManagerChangesSavedEvent()),
              child: const Text('SAVE CHANGES'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
            PublicationManagerSection(
              children: [
                const ImagePickerWidget(),
                LabeledTextField(
                  labelText: 'Book title',
                  hintText: 'Enter book title',
                ),
                LabeledTextField(
                  heightModifier: 0.3,
                  labelText: 'Book description',
                  hintText: 'Enter book description',
                ),
              ],
            ),
            PublicationManagerSection(
              children: [
                LabeledTextField(
                  labelText: 'Author name',
                  hintText: 'Enter author name',
                ),
                LabeledTextField(
                  labelText: 'Release year',
                  hintText: 'Enter release year',
                ),
                LabeledTextField(
                  labelText: 'Page count',
                  hintText: 'Enter page count',
                ),
                LabeledTextField(
                  labelText: 'Category',
                  hintText: 'Enter publication category',
                ),
                LabeledTextField(
                  labelText: 'Language',
                  hintText: 'Enter publication language',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
