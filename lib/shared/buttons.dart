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
      this.customColors,
      this.onlyUnderline,
      this.initUnderline})
      : super(key: key);
  final String text;
  final Function() onTap;
  final bool? outlined;
  final IconData? icon;
  final bool? onlyUnderline;
  final bool? initUnderline;
  final CustomPrimaryButtonDecoration? customColors;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  ThemeData themes = ThemeData();
  late Color backGroundColor;
  late Color foreGroundColor;
  late Color borderColor;
  late Color textColor;

  late final Color initBackGroundColor =
      widget.customColors?.primaryBackgroundColor ??
          (widget.outlined == true
              ? Theme.of(context).colorScheme.inversePrimary
              : Theme.of(context).colorScheme.primary);
  late final Color initForeGroundColor =
      widget.customColors?.primaryForegroundColor ??
          (widget.outlined == true
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.inversePrimary);
  late final Color initBorderColor = widget.customColors?.primaryBorderColor ??
      Theme.of(context).colorScheme.primary;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    textColor = widget.customColors?.primaryForegroundColor ?? initForeGroundColor;
  }

  void changeTextColor() {
    if (widget.onlyUnderline == true)
      return;
    else if (onHover) {
      textColor =
          widget.customColors?.secondaryForegroundColor ?? initBackGroundColor;
    } else {
      textColor =
          widget.customColors?.primaryForegroundColor ?? initForeGroundColor;
    }
    setState(() {
      textColor;
    });
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
            setState(() {
              onHover = val;
            });
            Future.delayed((kAnimationSpeed * 0.5), () {
              changeTextColor();
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
                      .scaleY(
                          duration: kAnimationSpeed,
                          delay: kAnimationDelay,
                          alignment: Alignment.bottomCenter)
                  : const SizedBox.shrink(),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
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
                                color: textColor,
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
                              : const SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              widget.onlyUnderline != true
                  ? Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: initBorderColor)),
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomPrimaryButtonDecoration {
  final Color primaryForegroundColor;
  final Color primaryBackgroundColor;
  final Color primaryBorderColor;
  final Color secondaryForegroundColor;
  final Color secondaryBackgroundColor;
  final Color secondaryBorderColor;

  CustomPrimaryButtonDecoration(
      {required this.primaryForegroundColor,
      required this.primaryBackgroundColor,
      required this.primaryBorderColor,
      required this.secondaryForegroundColor,
      required this.secondaryBackgroundColor,
      required this.secondaryBorderColor});
}
