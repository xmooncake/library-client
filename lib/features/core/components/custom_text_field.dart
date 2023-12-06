import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * (widthModifier ?? 1),
      height: MediaQuery.of(context).size.height * (heightModifier ?? 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (labelText != null)
            Row(
              children: [
                icon ?? const SizedBox(),
                SizedBox(width: icon == null ? 0 : 8),
                Text(
                  '$labelText',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(top: labelText == null ? 0 : 8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                validator: validator,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
