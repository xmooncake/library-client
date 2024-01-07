import 'package:flutter/material.dart';

import 'package:library_client/features/shared/error/data_error_template.widget.dart';

class DataEmptyWidget extends StatelessWidget {
  const DataEmptyWidget({super.key, this.message = 'No data found'});

  final String message;

  @override
  Widget build(BuildContext context) {
    return DataErrorWidgetTemplate(
      asset: 'assets/lottie/empty.json',
      title: message,
    );
  }
}
