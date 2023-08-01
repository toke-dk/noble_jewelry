import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:noble_jewelry/shared/variables.dart';

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
  late final Color initBorderColor = Theme.of(context).colorScheme.primary;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    backGroundColor = initBackGroundColor;
    foreGroundColor = initForeGroundColor;
    borderColor = initBorderColor;
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

  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: InkWell(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: widget.onTap,
          onHover: (val) {
            callOnHover(context, val);
            setState(() {
              onHover = val;
            });
          },
          child: Stack(
            children: [
              widget.onlyUnderline != true
                  ? Container(
                      color: initBackGroundColor,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const SizedBox.shrink(),
              widget.onlyUnderline != true
                  ? Container(
                      color: initForeGroundColor,
                      width: double.infinity,
                      height: double.infinity,
                    )
                      .animate(
                        target: onHover ? 1 : 0,
                      )
                      .scaleY(duration: kAnimationSpeed, delay: kAnimationDelay)
                  : const SizedBox.shrink(),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                    IntrinsicWidth(
                      stepWidth: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            widget.text,
                            style: TextStyle(
                                color: foreGroundColor,
                                fontWeight: widget.initUnderline == true
                                    ? FontWeight.bold
                                    : null),
                          ),
                          widget.onlyUnderline == true
                              ? Container(
                                      height: 2,
                                      color:
                                          Theme.of(context).colorScheme.primary)
                                  .animate(
                                    target:
                                        widget.initUnderline == true || onHover
                                            ? 1
                                            : 0,
                                  )
                                  .tint(
                                      color:
                                          Theme.of(context).colorScheme.primary)
                                  .scaleX(
                                      duration: kAnimationSpeed,
                                      delay: kAnimationDelay)
                              : SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              widget.onlyUnderline != true ? Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: initBorderColor)),
                width: double.infinity,
                height: double.infinity,
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
