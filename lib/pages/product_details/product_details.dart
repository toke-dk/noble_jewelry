import 'package:flutter/material.dart';
import 'package:noble_jewelry/pages/product_details/product_details_sections.dart';
import 'package:noble_jewelry/pages/shop/show_items_in_shop.dart';
import 'package:noble_jewelry/shared/variables.dart';
import 'package:noble_jewelry/widgets/show_product.dart';

import '../../models/product.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, this.product}) : super(key: key);
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        children: [
          Center(
            child: ProductSection(
              product: product ?? exampleProducts[0],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 100,
              )),
          InfoDetailsSection(
            product: product ?? exampleProducts[0],
          ),
          Divider(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3, (index) => ShowProduct(product: exampleProducts[index]))),
          )
        ],
      ),
    );
  }
}
