import 'package:flutter/cupertino.dart';
import 'package:noble_jewelry/models/product.dart';
import 'package:noble_jewelry/pages/about.dart';
import 'package:noble_jewelry/pages/product_details/product_details.dart';
import 'package:noble_jewelry/pages/stories.dart';
import 'package:noble_jewelry/pages/contact.dart';
import 'package:noble_jewelry/pages/home.dart';
import 'package:noble_jewelry/pages/shop/shop.dart';

enum Pages { home, shop, about, stories, contactUs, productDetails }

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
      case Pages.productDetails:
        return const ProductDetails();
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
      case Pages.productDetails:
        return "Product Details";
    }
  }
}

class PageProvider extends ChangeNotifier {
  /// TODO change this in production
  Pages _currentPage = Pages.productDetails;

  Pages get currentPage => _currentPage;

  void setCurrentPage(Pages page) {
    _currentPage = page;
    print("change");
    notifyListeners();
  }
}
