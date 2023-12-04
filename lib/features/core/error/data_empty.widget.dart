import 'package:flutter/material.dart';

import 'package:library_client/features/core/error/data_error_template.widget.dart';

class DataEmptyWidget extends StatelessWidget {
  const DataEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DataErrorWidgetTemplate(
      asset: 'assets/lottie/empty.json',
      title: 'No data found',
    );
  }
}
