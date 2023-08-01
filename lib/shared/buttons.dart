import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.outlined,
      this.icon})
      : super(key: key);
  final String text;
  final Function() onTap;
  final bool? outlined;
  final IconData? icon;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool doesHover = false;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = widget.outlined == true
        ? Colors.transparent
        : Theme.of(context).primaryColor;
    Color secondaryColor = widget.outlined == true
        ? Theme.of(context).primaryColor
        : Colors.transparent;

    Color primaryTextColor =
        primaryColor == Colors.transparent ? Colors.white : primaryColor;
    Color secondaryTextColor =
        secondaryColor == Colors.transparent ? Colors.white : secondaryColor;

    return InkWell(
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () => widget.onTap,
        onHover: (val) => setState(() {
              doesHover = val;
            }),
        child: Container(
          decoration: BoxDecoration(
              color: !doesHover ? primaryColor : secondaryColor,
              border:
                  Border.all(color: doesHover ? primaryColor : secondaryColor)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.icon != null
                  ? Row(
                      children: [
                        Icon(
                          widget.icon,
                          color:
                              doesHover ? primaryTextColor : secondaryTextColor,
                        ),
                        SizedBox(
                          width: 8,
                        )
                      ],
                    )
                  : const SizedBox(),
              Text(
                widget.text,
                style: TextStyle(
                    color: doesHover ? primaryTextColor : secondaryTextColor),
              ),
            ],
          ),
        ));
  }
}
