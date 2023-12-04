import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class DataErrorWidgetTemplate extends StatelessWidget {
  const DataErrorWidgetTemplate({
    required this.asset,
    required this.title,
    this.heightModifier = 0.4,
  });

  final String asset;
  final String title;
  final double heightModifier;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * heightModifier,
          child: Lottie.asset(asset),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
