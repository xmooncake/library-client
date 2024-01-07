import 'package:flutter/material.dart';

import 'package:library_client/features/shared/error/data_error_template.widget.dart';

class DataFailedWidget extends StatelessWidget {
  const DataFailedWidget({super.key, this.message = 'Failed to load data'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return DataErrorWidgetTemplate(
      asset: 'assets/lottie/failure.json',
      title: message,
    );
  }
}
