import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:library_client/features/app/router.dart';

class PublicationsFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () => context.go(AppRouter.addPublication),
      icon: const Icon(Icons.add),
      label: const Text('Add Publication'),
    );
  }
}
