import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noble_jewelry/shared/color_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/constants.dart';

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
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery
              .of(context)
              .size
              .width, 100),
          child: NavigationBar()),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPagePadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: SvgPicture.asset("lib/assets/images/logo-vertical.svg"),
              ),
              Expanded(
                child: Container(
                  child:
                  SvgPicture.asset("lib/assets/images/logo-with-text.svg"),
                ),
              ),
              Container(
                child: SvgPicture.asset("lib/assets/images/logo-vertical.svg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  List<MenuItem> allItems = const [
    MenuItem(
      text: "Home",
    ),
    MenuItem(
      text: "Shop",
    ),
    MenuItem(
      text: "Collections",
    ),
    MenuItem(
      text: "About",
    ),
    MenuItem(
      text: "Contact Us",
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 650,
      leading: Padding(
          padding: EdgeInsets.only(left: kPagePadding),
          child: Menu(
            allItems: allItems,
            currentIndex: currentIndex,
            onIndexChange: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
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

class Menu extends StatelessWidget {
  const Menu({Key? key,
    required this.allItems,
    required this.currentIndex,
    required this.onIndexChange})
      : super(key: key);
  final List<MenuItem> allItems;
  final int currentIndex;
  final Function(int) onIndexChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(allItems.length, (index) {
        final MenuItem currentItem = allItems[index];
        return InkWell(
            onTap: () => onIndexChange(index),
            child: Text(
              currentItem.text.toUpperCase(),
              style: TextStyle(
                  fontWeight: currentIndex == index ? FontWeight.w900 : null,
                  color: currentIndex == index
                      ? Theme
                      .of(context)
                      .colorScheme
                      .primary
                      : null),
            ));
      }),
    );
  }
}

class MenuItem {

  final String text;

  const MenuItem({Key? key,
    required this.text,
  });
}
