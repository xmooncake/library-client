import 'package:flutter/material.dart';

import 'package:library_client/features/core/components/custom_text_field.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomTextField(
        controller: TextEditingController(),
        labelText: 'labelText',
        hintText: 'hintText',
      ),
    );
  }
}
