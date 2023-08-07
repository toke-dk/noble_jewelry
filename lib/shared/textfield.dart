import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({Key? key, this.labelText, this.maxLines})
      : super(key: key);
  final String? labelText;
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

class MyInputQuantity extends StatefulWidget {
  const MyInputQuantity(
      {Key? key, this.maxVal, this.initVal, this.minVal, this.onQuantityChange})
      : super(key: key);
  final int? maxVal;
  final int? initVal;
  final int? minVal;
  final Function(int newQuantity)? onQuantityChange;

  @override
  State<MyInputQuantity> createState() => _MyInputQuantityState();
}

class _MyInputQuantityState extends State<MyInputQuantity> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 165),
        child: InputQty(
          isIntrinsicWidth: false,
          showMessageLimit: false,
          btnColor1: Theme.of(context).colorScheme.primary,
          btnColor2: Theme.of(context).colorScheme.primary,
          textFieldDecoration: InputDecoration(
            isDense: false,
          ),
          boxDecoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.primary,)
          ),
          onQtyChanged: (val) {},
        ));
  }
}
