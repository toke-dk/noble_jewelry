import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:noble_jewelry/models/product.dart';
import 'package:noble_jewelry/shared/variables.dart';
import 'package:noble_jewelry/widgets/show_product.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

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
        ChangePageIcon(
          selectedPage: selectedPage,
          totalAmountOfPages: totalAmountOfPages,
          pageController: _pageController,
          onPress: (int newPage) {
            print(newPage);
            setState(() {
              _pageController.animateToPage(0,
                  duration: 1.seconds, curve: Curves.easeInOutQuad);
            });
          },
          direction: Directions.backward,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                  height: 600,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: _pageController,
                    itemCount: totalAmountOfPages,
                    onPageChanged: (int newIndex) => setState(() {
                      selectedPage = newIndex;
                    }),
                    itemBuilder: (context, indexWeek) {
                      final int startRange = indexWeek*itemsPerView;
                      final int endRange = min(startRange + itemsPerView, products.length - 1);
                      final int rangeSize = endRange-startRange;
                      List<Product> productsToShow = products.getRange(startRange, endRange).toList();
                      return ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            width: 16,
                          ),
                          itemCount: rangeSize,
                          padding: const EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return counter <= products.length
                                ? ShowProduct(product: productsToShow[index])
                                : const SizedBox();
                          });
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
        ChangePageIcon(
          selectedPage: selectedPage,
          totalAmountOfPages: totalAmountOfPages,
          pageController: _pageController,
          onPress: (int newPage) {
            setState(() {
              _pageController.animateToPage(newPage,
                  duration: 1.seconds, curve: Curves.easeInOutQuad);
            });
          },
          direction: Directions.forward,
        ),
      ],
    );
  }
}

class ChangePageIcon extends StatefulWidget {
  const ChangePageIcon(
      {Key? key,
        required this.selectedPage,
        required this.totalAmountOfPages,
        required this.pageController,
        required this.onPress,
        required this.direction})
      : super(key: key);
  final int selectedPage;

  final int totalAmountOfPages;

  final PageController pageController;

  final Function(int newPage) onPress;

  final Directions direction;

  @override
  State<ChangePageIcon> createState() => _ChangePageIconState();
}

class _ChangePageIconState extends State<ChangePageIcon> {
  @override
  Widget build(BuildContext context) {
    final bool isAtEnd = widget.direction == Directions.forward
        ? widget.selectedPage == widget.totalAmountOfPages - 1
        : widget.selectedPage == 0;
    return IconButton(
        onPressed: !isAtEnd
            ? () {
          int newPageIndex;
          if (widget.direction == Directions.forward) {
            newPageIndex = widget.selectedPage + 1;
          } else {
            newPageIndex = widget.selectedPage - 1;
          }
          widget.onPress(newPageIndex);
        }
            : null,
        disabledColor:
        Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        color: Theme.of(context).colorScheme.inversePrimary,
        icon: Icon(
          widget.direction == Directions.forward
              ? Icons.chevron_right
              : Icons.chevron_left,
        ));
  }
}

enum Directions { forward, backward }
