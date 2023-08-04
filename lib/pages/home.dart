import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/variables.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../models/product.dart';
import '../widgets/show_product.dart';

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
          swapImageAndText != true ? imageWidget : SizedBox.shrink(),
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
                  : SizedBox.shrink(),
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

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const double contentSpacing = 100;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 720,
          width: double.infinity,
          child: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        "lib/assets/images/about_images/wood-tree.png",
                        fit: BoxFit.cover,
                      ),
                    ),
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
                      const Spacer(flex: 6),
                      Image.asset("lib/assets/images/logo/noble-only-text.png"),
                      const Spacer(flex: 6),
                      Text(
                        "Sophistication Unveiled, Nobility Redefined"
                            .toUpperCase(),
                        textAlign: TextAlign.center,
                        style: textTheme.headlineLarge!
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(
                        "Elevate your style with our high-quality, high-status bracelets. Make a statement of sophistication and class."
                            .toUpperCase(),
                        textAlign: TextAlign.center,
                        style: textTheme.headlineSmall!
                            .copyWith(color: Colors.white),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      PrimaryButton(
                        customColors: CustomPrimaryButtonDecoration(
                          primaryBackgroundColor: Colors.transparent,
                          primaryForegroundColor: Colors.white,
                          primaryBorderColor: Colors.white,
                          secondaryBackgroundColor: Colors.white,
                          secondaryForegroundColor: Colors.black,
                          secondaryBorderColor: Colors.transparent,
                        ),
                        text: "What's new".toUpperCase(),
                        onTap: () {},
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            color: colorScheme.inversePrimary,
                          )),
                      const Spacer(
                        flex: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Column(
          children: [
            Center(
                child: Text("Most popular".toUpperCase(),
                    style: Theme.of(context).textTheme.headlineLarge!)),
            Center(
                child: Text(
              "Discover the Irresistible Favorites: Unmatched in Quality and Admired by All!",
              style: Theme.of(context).textTheme.bodyMedium!,
            )),
            const SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4,
                      (index) => ShowProduct(product: exampleProducts[index])),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: ImageWithText(
            image:
                SizedBox(width: 100, height: 100, child: const Placeholder()),
            bodyText:
                '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla',
            title: 'COLLECTION “Victorian Nobility” COMING SOON'.toUpperCase(),
            button: PrimaryButton(
              outlined: true,
              text: "Early Acess".toUpperCase(),
              onTap: () {},
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: Text(
            "Collections".toUpperCase(),
            style: textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Center(
          child: SizedBox(
            width: 1400,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => Column(
                          children: [
                            const Placeholder(),
                            PrimaryButton(
                              text: "Noble Origins".toUpperCase(),
                              onTap: () {},
                              onlyUnderline: true,
                              outlined: true,
                              trailingIcon: Icons.chevron_right,
                            )
                          ],
                        ))),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: Text(
            "New arrivals".toUpperCase(),
            style: textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        const MultiRow(),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/images/bracelets/brace1.png"),
                const SizedBox(
                  width: 80,
                ),
                Flexible(
                  child: Container(
                    width: 350,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nature's finesse on your wrist".toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "Explore Our High-Quality Wooden Bracelets"
                              .toUpperCase(),
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        PrimaryButton(
                          text: "shop now".toUpperCase(),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: Container(
            height: 460,
            constraints: const BoxConstraints(maxWidth: 800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Collection "시작" coming soon'.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla",
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        PrimaryButton(
                          outlined: true,
                          text: "preorder".toUpperCase(),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          right: 0,
                          top: 12,
                          child: Image.asset(
                              "lib/assets/images/bracelets/brace3.png")),
                      Positioned(
                          left: 0,
                          top: 0,
                          child: Image.asset(
                              "lib/assets/images/bracelets/brace4.png")),
                      Positioned(
                          left: 6,
                          bottom: 8,
                          child: Image.asset(
                              "lib/assets/images/bracelets/brace2.png")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: SizedBox(
            height: 1000,
            width: 1100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About Us".toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          PrimaryButton(
                              text: "About page".toUpperCase(), onTap: () {})
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla"),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                          "lib/assets/images/about_images/woodcraft.png")
                    ],
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          "lib/assets/images/about_images/handshake.png"),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contact Us".toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          PrimaryButton(
                              text: "Contact page".toUpperCase(), onTap: () {})
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla"),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
