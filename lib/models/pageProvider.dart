import 'package:flutter/cupertino.dart';
import 'package:noble_jewelry/pages/about.dart';
import 'package:noble_jewelry/pages/stories.dart';
import 'package:noble_jewelry/pages/contact.dart';
import 'package:noble_jewelry/pages/home.dart';
import 'package:noble_jewelry/pages/shop.dart';

enum Pages { home, shop, about, stories, contactUs }

extension MenuItemsNavigator on Pages {
  Widget get showPage {
    switch (this) {
      case Pages.home:
        return const Home();
      case Pages.shop:
        return const Shop();
      case Pages.stories:
        return const Stories();
      case Pages.about:
        return const About();
      case Pages.contactUs:
        return const Contact();
    }
  }

  String get getName {
    switch (this) {
      case Pages.home:
        return "Home";
      case Pages.shop:
        return "Shop";
      case Pages.stories:
        return "Stories";
      case Pages.about:
        return "About";
      case Pages.contactUs:
        return "Contact Us";
    }
  }
}

class PageProvider extends ChangeNotifier {
  /// TODO change this in production
  Pages _currentPage = Pages.home;

  Pages get currentPage => _currentPage;

  void setCurrentPage(Pages page) {
    _currentPage = page;
    print("change");
    notifyListeners();
  }
}
