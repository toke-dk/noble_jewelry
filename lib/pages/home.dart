import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const double contentSpacing = 250;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                child: SvgPicture.asset(
                    "lib/assets/images/logo/logo-vertical.svg"),
              ),
              Expanded(
                child: Container(
                  child: SvgPicture.asset(
                      "lib/assets/images/logo/logo-with-text.svg"),
                ),
              ),
              Container(
                child: SvgPicture.asset(
                    "lib/assets/images/logo/logo-vertical.svg"),
              ),
            ],
          ),
          const SizedBox(
            height: contentSpacing,
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("lib/assets/images/bracelets/brace1.png"),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(left: 80),
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
              constraints: BoxConstraints(maxWidth: 800),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: Container(
                      width: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Collection "시작" comming soon',
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
                  Container(
                    width: 350,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(right: 0, top: 12, child: Image.asset("lib/assets/images/bracelets/brace3.png")),
                        Positioned(left: 0, top: 0, child: Image.asset("lib/assets/images/bracelets/brace4.png")),
                        Positioned(left: 6, bottom: 8, child: Image.asset("lib/assets/images/bracelets/brace2.png")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
