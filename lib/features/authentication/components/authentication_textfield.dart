import 'package:flutter/material.dart';

class AuthenticationInputField extends StatelessWidget {
  const AuthenticationInputField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.iconData,
    this.validator,
  });

  final String labelText;
  final String hintText;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(iconData),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
      ),
      validator: validator,
    );
  }
}
