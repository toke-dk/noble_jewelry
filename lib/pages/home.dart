import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/variables.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../models/product.dart';
import '../widgets/show_product.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const double contentSpacing = 250;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
          child: Row(
            children: [
              SizedBox(
                child: SvgPicture.asset(
                    "lib/assets/images/logo/logo-vertical.svg"),
              ),
              Expanded(
                child: SvgPicture.asset(
                    "lib/assets/images/logo/logo-with-text.svg"),
              ),
              SvgPicture.asset("lib/assets/images/logo/logo-vertical.svg"),
            ],
          ),
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          color: Theme.of(context).primaryColor.withOpacity(0.9),
          child: Column(
            children: [
              Center(
                  child: Text(
                "Most popular".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )),
              Center(
                  child: Text(
                "Discover the Irresistible Favorites: Unmatched in Quality and Admired by All!",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )),
              const SizedBox(
                height: 30,
              ),
              HorizontalProductScroll()
            ],
          ),
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

class HorizontalProductScroll extends StatefulWidget {
  const HorizontalProductScroll({Key? key}) : super(key: key);

  @override
  State<HorizontalProductScroll> createState() =>
      _HorizontalProductScrollState();
}

class _HorizontalProductScrollState extends State<HorizontalProductScroll> {
  final List<Product> products = exampleProducts;
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);

    super.initState();
  }

  final int itemsPerView = 4;
  late int totalAmountOfPages = (products.length / itemsPerView).ceil();

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: () => setState(() {
              selectedPage = 0;
            }),
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(selectedPage == 0 ? 0.2 : 1),
            )),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                  height: 600,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: totalAmountOfPages,
                    onPageChanged: (int newIndex) => setState(() {
                      selectedPage = newIndex;
                    }),
                    itemBuilder: (context, indexWeek) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: ListView.separated(
                              shrinkWrap: true,
                              separatorBuilder: (context, index) => SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.07,
                                  ),
                              itemCount: itemsPerView,
                              padding: const EdgeInsets.all(10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                counter++;
                                return counter <= products.length
                                    ? ShowProduct(
                                        product: products[counter - 1])
                                    : const SizedBox();
                              }),
                        ),
                      );
                    },
                  )),
              PageViewDotIndicator(
                  borderColor: Theme.of(context).colorScheme.inversePrimary,
                  currentItem: selectedPage,
                  count: totalAmountOfPages,
                  unselectedColor: Theme.of(context).colorScheme.primary,
                  selectedColor: Theme.of(context).colorScheme.inversePrimary),
            ],
          ),
        ),
      ],
    );
  }
}
