import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:noble_jewelry/shared/variables.dart';

import '../shared/buttons.dart';

class HoverScaleWidget extends StatefulWidget {
  const HoverScaleWidget({Key? key, required this.child, this.onTap})
      : super(key: key);
  final Widget child;
  final Function()? onTap;

  @override
  State<HoverScaleWidget> createState() => _HoverScaleWidgetState();
}

class _HoverScaleWidgetState extends State<HoverScaleWidget> {
  bool isHovering = false;
  final double scaleFactor = 1.007;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () => widget.onTap,
      onHover: (val) => setState(() {
        isHovering = val;
      }),
      child: widget.child.animate(target: isHovering ? 1 : 0).scale(
          delay: kAnimationDelay,
          duration: kAnimationSpeed,
          begin: Offset(1, 1),
          end: Offset(scaleFactor, scaleFactor)),
    );
  }
}

class MultiColumnSection {
  final String? title;
  final String? bodyText;

  MultiColumnSection({this.title, this.bodyText});
}

class MultiColumn extends StatefulWidget {
  const MultiColumn({Key? key, required this.sections}) : super(key: key);
  final List<MultiColumnSection> sections;

  @override
  State<MultiColumn> createState() => _MultiColumnState();
}

class _MultiColumnState extends State<MultiColumn> {
  @override
  Widget build(BuildContext context) {
    return HoverScaleWidget(
      child: Container(
        width: 1100,
        child: IntrinsicHeight(
          child: Row(
            children: List.generate(widget.sections.length, (index) {
              final currentSection = widget.sections[index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.04),
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentSection.title ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(currentSection.bodyText ?? "")
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ).animate(),
    );
  }
}

class MultiRow extends StatelessWidget {
  const MultiRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: List.generate(
                3,
                (index) => Padding(
                      padding: EdgeInsets.only(bottom: index != 3 ? 40 : 0),
                      child: ImageWithText(
                          image: const Placeholder(),
                          swapImageAndText: index % 2 == 0,
                          title: "Row",
                          subTitle: "Caption",
                          bodyText:
                              "Pair text with an image to focus on your chosen product, collection, or blog post. Add details on availability, style, or even provide a review."),
                    )),
          ),
        ),
      ],
    );
  }
}

class ImageBanner extends StatelessWidget {
  const ImageBanner(
      {Key? key,
      required this.image,
      this.title,
      this.subtitle,
      this.buttonText,
      this.onButtonPressed,
      this.onArrowPress})
      : super(key: key);
  final Widget image;
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final Function()? onButtonPressed;
  final Function()? onArrowPress;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            children: [
              Positioned.fill(child: image),
              Positioned.fill(
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 700,
            child: Column(
              children: [
                const Spacer(flex: 7),
                Text(
                  title ?? "",
                  textAlign: TextAlign.center,
                  style: textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                Text(
                  subtitle ?? "",
                  textAlign: TextAlign.center,
                  style: textTheme.headlineSmall!.copyWith(color: Colors.white),
                ),
                const Spacer(
                  flex: 1,
                ),
                buttonText != null
                    ? PrimaryButton(
                        customColors: CustomPrimaryButtonDecoration(
                          primaryBackgroundColor: Colors.transparent,
                          primaryForegroundColor: Colors.white,
                          primaryBorderColor: Colors.white,
                          secondaryBackgroundColor: Colors.white,
                          secondaryForegroundColor: Colors.black,
                          secondaryBorderColor: Colors.transparent,
                        ),
                        text: buttonText!,
                        onTap: () => onButtonPressed,
                      )
                    : const SizedBox.shrink(),
                onArrowPress != null
                    ? IconButton(
                        onPressed: () => onArrowPress,
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: colorScheme.inversePrimary,
                        ))
                    : const SizedBox.shrink(),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWithText extends StatelessWidget {
  const ImageWithText(
      {Key? key,
      required this.image,
      this.title,
      this.subTitle,
      required this.bodyText,
      this.button,
      this.swapImageAndText})
      : super(key: key);
  final Widget image;
  final String? title;
  final String? subTitle;
  final String bodyText;
  final Widget? button;
  final bool? swapImageAndText;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorTheme = Theme.of(context).colorScheme;

    final Widget imageWidget = Expanded(
      child: FittedBox(fit: BoxFit.contain, child: image),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 1100,
        maxHeight: 458,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          swapImageAndText != true ? imageWidget : const SizedBox.shrink(),
          SizedBox(
            width: swapImageAndText != true ? 50 : 0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              subTitle != null
                  ? Text(
                      subTitle!,
                      style: textTheme.headlineSmall!
                          .copyWith(color: colorTheme.primary.withOpacity(0.5)),
                    )
                  : const SizedBox.shrink(),
              title != null
                  ? Text(
                      title!,
                      style: textTheme.headlineLarge,
                    )
                  : const SizedBox.shrink(),
              Text(bodyText),
              const SizedBox(
                height: 30,
              ),
              button ?? const SizedBox.shrink()
            ],
          )),
          SizedBox(
            width: swapImageAndText == true ? 50 : 0,
          ),
          swapImageAndText == true ? imageWidget : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
