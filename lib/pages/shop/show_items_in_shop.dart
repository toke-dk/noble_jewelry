import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noble_jewelry/models/pageProvider.dart';
import 'package:noble_jewelry/models/product.dart';
import 'package:noble_jewelry/widgets/show_product.dart';
import 'package:provider/provider.dart';

class ShowItemsInShop extends StatelessWidget {
  const ShowItemsInShop({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double widgetSize = constraints.maxWidth;
      Size productsSize = const Size(270, 540);
      int columns = widgetSize ~/
          productsSize.width; // Assuming each item has a width of 220
      columns = columns > 1 ? columns : 1;
      return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: productsSize.width / productsSize.height,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          Product currentProduct = products[index];
          return Container(
            width: productsSize.width,
            height: productsSize.height,
            child: ShowProduct(
              alignment: Alignment.topCenter,
              product: currentProduct,
            ),
          );
        },
      );
    });
  }
}
