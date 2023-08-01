import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/variables.dart';
import 'package:provider/provider.dart';

import '../models/pageProvider.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({Key? key, required this.allPages}) : super(key: key);
  final List<Pages> allPages;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: kPagePadding, right: kPagePadding, bottom: 25, top: 25),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            left: 0,
            child: Menu(),
          ),
          Positioned(
            right: 0,
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_basket_rounded)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
              ],
            ),
          ),
          SizedBox.expand(
            child: FittedBox(
              child: InkWell(
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () => Provider.of<PageProvider>(context, listen: false)
                      .setCurrentPage(Pages.home),
                  child: SvgPicture.asset(
                      "lib/assets/images/logo/logo-and-name.svg")),
            ),
          ),
        ],
      ),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  List<Pages> allPages = Pages.values;

  Pages? currentHoveredItem;

  Pages getCurrentPage(context) =>
      Provider.of<PageProvider>(context, listen: true).currentPage;

  void setCurrentPage(context, page) =>
      Provider.of<PageProvider>(context, listen: false).setCurrentPage(page);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(allPages.length, (index) {
        Pages currentIndexPage = allPages[index];
          return PrimaryButton(
            text: currentIndexPage.getName.toUpperCase(),
            onTap: () => setState((){setCurrentPage(context, currentIndexPage);}),
            outlined: true,
            initUnderline: getCurrentPage(context) == currentIndexPage,
            onlyUnderline: true,
          );


      }),
    );
  }
}
