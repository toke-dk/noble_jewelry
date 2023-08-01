import 'package:flutter/material.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/widgets/top_page_title.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  final double contentSpacing = 170;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          const SizedBox(
              width: 800,
              child: TopPageTitle(
                centerText: true,
                headlineSmall: 'About',
                bodyWidth: 720,
                bodyText:
                    "At NOBLE, we craft exquisite wood bracelets, seamlessly blending elegance with nature. Our journey embraces sustainable craftsmanship, preserving Earth's wonders. Discover wearable treasures from lush forests, shaped by skilled artisans. Embrace sustainable chic in our exclusive collection—an enchanting journey from forest to fashion, celebrating nature's allure and style.",
                headlineLarge:
                    'From Forest to Fashion:\nThe Journey of Our Exclusive Bracelets',
              )),
          SizedBox(
            height: contentSpacing,
          ),
          Container(
            width: double.infinity,
            height: 780,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 0,
                    child: Image.asset(
                        "lib/assets/images/about_images/handshake.png")),
                Positioned(
                    right: 0,
                    top: 50,
                    child: Image.asset(
                        "lib/assets/images/about_images/wood-tree.png")),
                Positioned(
                    left: 0,
                    top: 0,
                    child: Image.asset(
                      "lib/assets/images/about_images/tree.png",
                      scale: 1.2,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: contentSpacing,
          ),
          _Section(
            subtitle: 'Craftsmen',
            title: 'Empowering Local Artisans',
            text:
                'Our commitment to ethical practices extends beyond sourcing. We collaborate with local artisans, empowering them with fair wages and safe working conditions. By supporting these talented individuals, we foster a community of creativity and craftsmanship, elevating the quality of each wood bracelet they create.',
          ),
          SizedBox(
            height: contentSpacing,
          ),
          _Section(
            reverse: true,
            subtitle: 'Craftsmen',
            title: 'Empowering Local Artisans',
            text:
                'Our commitment to ethical practices extends beyond sourcing. We collaborate with local artisans, empowering them with fair wages and safe working conditions. By supporting these talented individuals, we foster a community of creativity and craftsmanship, elevating the quality of each wood bracelet they create.',
          ),
          SizedBox(
            height: contentSpacing,
          ),
          _Section(
            subtitle: 'Craftsmen',
            title: 'Empowering Local Artisans',
            text:
                'Our commitment to ethical practices extends beyond sourcing. We collaborate with local artisans, empowering them with fair wages and safe working conditions. By supporting these talented individuals, we foster a community of creativity and craftsmanship, elevating the quality of each wood bracelet they create.',
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  _Section(
      {Key? key,
      required this.subtitle,
      required this.title,
      required this.text,
      this.buttonText,
      this.onButtonTap,
      this.reverse})
      : super(key: key);
  final String subtitle;
  final String title;
  final String text;
  final String? buttonText;
  final VoidCallbackAction? onButtonTap;
  final bool? reverse;

  final Widget image =
      Image.asset("lib/assets/images/about_images/woodcraft.png");
  static const double spaceBetweenImages = 60;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        reverse != true
            ? Row(
                children: [
                  image,
                  const SizedBox(
                    width: spaceBetweenImages,
                  ),
                ],
              )
            : SizedBox(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitle.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Theme.of(context).colorScheme.tertiary),
              ),
              Text(
                title.toUpperCase(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 20,
              ),
              Text(text),
              buttonText != null
                  ? PrimaryButton(
                      text: buttonText!.toUpperCase(), onTap: () => onButtonTap)
                  : const SizedBox(),
            ],
          ),
        ),
        reverse == true
            ? Row(
                children: [
                  const SizedBox(
                    width: spaceBetweenImages,
                  ),
                  image,
                ],
              )
            : SizedBox(),
      ],
    );
  }
}
