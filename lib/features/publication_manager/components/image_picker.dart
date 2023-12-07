import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:library_client/features/publication_manager/bloc/publication_manager_bloc.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        return InkWell(
          onTap: () => context.read<PublicationManagerBloc>().add(
                const PublicationManagerOnSelectImageEvent(),
              ),
          child: Container(
            width: constraints.maxWidth * 0.7,
            height: size.height * 0.4,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(child: Icon(Icons.add_a_photo)),
          ),
        );
      },
    );
  }
}
