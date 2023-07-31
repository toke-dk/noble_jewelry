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
              constraints: const BoxConstraints(maxWidth: 1100),
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
              constraints: const BoxConstraints(maxWidth: 800),
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
              child: Text(
            "Most popular".toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge,
          )),
          const ShowProduct()
        ],
      ),
    );
  }
}

class ShowProduct extends StatefulWidget {
  const ShowProduct({Key? key}) : super(key: key);

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      height: 558,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: Text(
                "Label",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 12),
                      width: 134,
                      height: 21,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text(
                        "Collection name",
                        style: Theme.of(context).textTheme.bodySmall,
                      )),
                    ),
                  ),
                  Image.asset(
                    "lib/assets/images/bracelets/brace5.png",
                    height: 275,
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text("Name"),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        "Old price",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "New Price",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  PrimaryButton(
                    icon: Icons.shopping_basket,
                    text: 'Shop Now'.toUpperCase(), onTap: () {  },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
