import 'package:flutter/cupertino.dart';

import 'collections.dart';

enum Labels { bestSelling, sale, soldOut }

extension LabelsExtension on Labels {
  String get getName {
    switch (this) {
      case Labels.bestSelling:
        return "Best Selling";
      case Labels.sale:
        return "Sale";
      case Labels.soldOut:
        return "Sould Out";
    }
  }
}

class Product {
  final Image image;
  final String name;
  final double priceUSD;
  final double? oldPriceUSD;
  final Collections? collections;
  final int? amountInStock;
  final int? totalAmountSold;
  final Labels? label;
  final double? size;
  final String? description;

  Product({
    this.description,
    this.size,
    this.label,
    required this.image,
    required this.name,
    required this.priceUSD,
    this.oldPriceUSD,
    this.collections,
    this.amountInStock,
    this.totalAmountSold,
  });

  double get calculateDiscount => (priceUSD - oldPriceUSD!) / oldPriceUSD!;
}

extension ProductsListExtension on List<Product> {
  /// Todo: make this function
  List<Product> get calculateNBestSellingProducts {
    return [];
  }
}
