import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.outlined,
      this.icon,
      this.onlyUnderline,
      this.initUnderline})
      : super(key: key);
  final String text;
  final Function() onTap;
  final bool? outlined;
  final IconData? icon;
  final bool? onlyUnderline;
  final bool? initUnderline;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  ThemeData themes = ThemeData();
  late Color backGroundColor;
  late Color foreGroundColor;
  late Color borderColor;

  late final Color initBackGroundColor = widget.outlined == true
      ? Theme.of(context).colorScheme.inversePrimary
      : Theme.of(context).colorScheme.primary;
  late final Color initForeGroundColor = widget.outlined == true
      ? Theme.of(context).colorScheme.primary
      : Theme.of(context).colorScheme.inversePrimary;
  late final Color initBorderColor = widget.outlined != true
      ? Colors.transparent
      : Theme.of(context).colorScheme.primary;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    backGroundColor = initBackGroundColor;
    foreGroundColor = initForeGroundColor;
    borderColor =
        widget.onlyUnderline == true ? Colors.transparent : initBorderColor;
  }

  void callOnHover(BuildContext context, bool newHoverValue) {
    if (widget.onlyUnderline != true) {
      if (newHoverValue) {
        backGroundColor = initForeGroundColor;
        foreGroundColor = initBackGroundColor;
        borderColor =
            widget.outlined == true ? Colors.transparent : initBackGroundColor;
      } else {
        backGroundColor = initBackGroundColor;
        foreGroundColor = initForeGroundColor;
        borderColor =
            widget.outlined == true ? initForeGroundColor : Colors.transparent;
      }
      setState(() {
        backGroundColor;
        foreGroundColor;
        borderColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        onHover: (val) => callOnHover(context, val),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: backGroundColor, border: Border.all(color: borderColor)),
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
                          color: foreGroundColor,
                        ),
                        const SizedBox(
                          width: 8,
                        )
                      ],
                    )
                  : const SizedBox(),
              Column(
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(color: foreGroundColor),
                  ),
                  widget.onlyUnderline == true
                      ? Container(
                          height: 2,
                          width: widget.initUnderline == true ? 20 : 0,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      : SizedBox()
                ],
              ),
            ],
          ),
        ));
  }
}
