import 'package:flutter/material.dart';

import 'package:library_client/features/shared/components/labeled_field.dart';

class LabeledTextField extends StatelessWidget {
  LabeledTextField({
    TextEditingController? controller,
    required this.labelText,
    required this.hintText,
    this.icon,
    this.validator,
    this.widthModifier,
    this.heightModifier,
  }) : controller = controller ?? TextEditingController();

  final String? labelText;
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final double? widthModifier;
  final double? heightModifier;

  @override
  Widget build(BuildContext context) {
    return LabeledField(
      labelText: labelText,
      icon: icon,
      widthModifier: widthModifier,
      heightModifier: heightModifier,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
