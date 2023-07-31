import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/models/collections.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/constants.dart';
import 'package:noble_jewelry/shared/number_convert.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../models/product.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const double contentSpacing = 250;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
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
          child: Container(
            height: 1000,
            width: 1100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Container(
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
                            PrimaryButton(text: "About page".toUpperCase(), onTap: (){})
                          ],
                        ),
                        SizedBox(height: 22,),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla"),
                        SizedBox(height: 40,),
                        Image.asset("lib/assets/images/about_images/woodcraft.png")
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("lib/assets/images/about_images/handshake.png"),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contact Us".toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          PrimaryButton(text: "Contact page".toUpperCase(), onTap: (){})
                        ],
                      ),
                      SizedBox(height: 22,),
                      Text(
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

class HorizontalProductScroll extends StatelessWidget {
  HorizontalProductScroll({Key? key}) : super(key: key);

  final List<Product> products = [
    Product(
        label: Labels.soldOut,
        collections: Collections.theBeginning,
        oldPriceUSD: 1299,
        image: Image.asset("lib/assets/images/bracelets/brace5.png"),
        name: "a",
        priceUSD: 999),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace6.png"),
        name: "b",
        priceUSD: 2),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace7.png"),
        name: "c",
        priceUSD: 3),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace8.png"),
        name: "d",
        priceUSD: 4),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace9.png"),
        name: "e",
        priceUSD: 5),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace5.png"),
        name: "f",
        priceUSD: 6),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace5.png"),
        name: "g",
        priceUSD: 7),
    Product(
        image: Image.asset("lib/assets/images/bracelets/brace5.png"),
        name: "h",
        priceUSD: 8),
  ];

  final int itemsPerView = 4;

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return SizedBox(
        height: 600,
        child: ScrollablePositionedList.builder(
          itemCount: (products.length / itemsPerView).ceil(),
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, indexWeek) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.07,
                        ),
                    itemCount: itemsPerView,
                    padding: const EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      counter++;
                      return counter <= products.length
                          ? ShowProduct(product: products[counter - 1])
                          : const SizedBox();
                    }),
              ),
            );
          },
        ));
  }
}

class ShowProduct extends StatefulWidget {
  const ShowProduct({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        constraints: const BoxConstraints(
          maxWidth: 300,
          minWidth: 300,
          maxHeight: 540,
          minHeight: 540,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.product.label != null
                ? Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Text(
                        widget.product.label!.getName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 55, bottom: 30, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.product.collections != null
                        ? Center(
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
                                widget.product.collections!.getName,
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                            ),
                          )
                        : const SizedBox(),
                    widget.product.image,
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.product.priceUSD.convertDoublePriceToString,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        widget.product.oldPriceUSD != null
                            ? Text(
                                widget.product.oldPriceUSD!
                                    .convertDoublePriceToString,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PrimaryButton(
                      outlined: true,
                      text: 'Discover'.toUpperCase(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
