import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_jewelry/pages/about.dart';
import 'package:noble_jewelry/pages/collections.dart';
import 'package:noble_jewelry/pages/contact.dart';
import 'package:noble_jewelry/pages/shop.dart';
import 'package:noble_jewelry/shared/color_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/constants.dart';
import 'package:noble_jewelry/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            toolbarHeight: 110,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0),
        primarySwatch: Palette.kPrimaryMaterialColor,
      ),
      home: const Content(),
    );
  }
}

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final List<MenuItems> allItems = MenuItems.values.map((e) => e).toList();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: NavigationBar(
            allItems: allItems,
            currentIndex: currentIndex,
            onIndexChange: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          )),
      body: allItems[currentIndex].showPage
    );
  }
}

enum MenuItems { home, shop, collections, about, contact }

extension MenuItemsNavigator on MenuItems {
  Widget get showPage {
    switch (this) {
      case MenuItems.home:
        return Home();
      case MenuItems.shop:
        return Shop();
      case MenuItems.collections:
        return Collections();
      case MenuItems.about:
        return About();
      case MenuItems.contact:
        return Contact();
    }
  }
}

class NavigationBar extends StatelessWidget {
  const NavigationBar(
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
          padding: EdgeInsets.only(left: kPagePadding),
          child: Menu(
            allItems: allItems,
            currentIndex: currentIndex,
            onIndexChange: (int index) => onIndexChange(index),
          )),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_basket_rounded)),
        IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        SizedBox(
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
              padding: EdgeInsets.all(12),
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
