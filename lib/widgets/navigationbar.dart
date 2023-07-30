import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/pages/about.dart';
import 'package:noble_jewelry/pages/collections.dart';
import 'package:noble_jewelry/pages/contact.dart';
import 'package:noble_jewelry/pages/home.dart';
import 'package:noble_jewelry/pages/shop.dart';
import 'package:noble_jewelry/shared/constants.dart';

enum MenuItems { home, shop, collections, about, contact }

extension MenuItemsNavigator on MenuItems {
  Widget get showPage {
    switch (this) {
      case MenuItems.home:
        return const Home();
      case MenuItems.shop:
        return const Shop();
      case MenuItems.collections:
        return const Collections();
      case MenuItems.about:
        return const About();
      case MenuItems.contact:
        return const Contact();
    }
  }
}

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar(
      {Key? key,
      required this.allItems,
      required this.currentIndex,
      required this.onIndexChange})
      : super(key: key);
  final List<MenuItems> allItems;
  final int currentIndex;
  final Function(int index) onIndexChange;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 650,
      leading: Padding(
          padding: const EdgeInsets.only(left: kPagePadding),
          child: Menu(
            allItems: allItems,
            currentIndex: currentIndex,
            onIndexChange: (int index) => onIndexChange(index),
          )),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_basket_rounded)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        const SizedBox(
          width: kPagePadding,
        )
      ],
      title: Row(
        children: [
          Container(
              height: 100,
              child: SvgPicture.asset("lib/assets/images/logo-and-name.svg")),
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu(
      {Key? key,
      required this.allItems,
      required this.currentIndex,
      required this.onIndexChange})
      : super(key: key);
  final List<MenuItems> allItems;
  final int currentIndex;
  final Function(int) onIndexChange;

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  MenuItems? currentHoveredItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.allItems.length, (index) {
        final MenuItems currentItem = widget.allItems[index];
        return InkWell(
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => widget.onIndexChange(index),
            onHover: (val) => setState(() {
                  val == true
                      ? currentHoveredItem = currentItem
                      : currentHoveredItem = null;
                }),
            child: Container(
              decoration: BoxDecoration(
                  color: index == widget.currentIndex
                      ? Theme.of(context).colorScheme.primary
                      : null,
                  border: Border.all(
                      color: currentItem == currentHoveredItem
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent)),
              padding: const EdgeInsets.all(12),
              child: Text(
                currentItem.name.toUpperCase(),
                style: TextStyle(
                    color: index == widget.currentIndex ? Colors.white : null),
              ),
            ));
      }),
    );
  }
}
