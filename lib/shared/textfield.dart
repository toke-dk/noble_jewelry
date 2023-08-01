import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({Key? key, required this.labelText, this.maxLines}) : super(key: key);
  final String labelText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.top,
      keyboardType: maxLines != null ? TextInputType.multiline : null,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
    );
  }
}
