import 'package:flutter/cupertino.dart';
import 'package:noble_jewelry/pages/about.dart';
import 'package:noble_jewelry/pages/collections.dart';
import 'package:noble_jewelry/pages/contact.dart';
import 'package:noble_jewelry/pages/home.dart';
import 'package:noble_jewelry/pages/shop.dart';

enum Pages { home, shop, collections, about, contact }

extension MenuItemsNavigator on Pages {
  Widget get showPage {
    switch (this) {
      case Pages.home:
        return const Home();
      case Pages.shop:
        return const Shop();
      case Pages.collections:
        return const CollectionsPage();
      case Pages.about:
        return const About();
      case Pages.contact:
        return const Contact();
    }
  }
}

class PageProvider extends ChangeNotifier {
  Pages _currentPage = Pages.home;

  Pages get currentPage => _currentPage;

  void setCurrentPage(Pages page) {
    _currentPage = page;
    print("change");
    notifyListeners();
  }
}
