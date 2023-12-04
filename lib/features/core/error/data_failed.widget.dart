import 'package:flutter/material.dart';

import 'package:library_client/features/core/error/data_error_template.widget.dart';

class DataFailedWidget extends StatelessWidget {
  const DataFailedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataErrorWidgetTemplate(
      asset: 'assets/lottie/failure.json',
      title: 'Failed to load data',
    );
  }
}
