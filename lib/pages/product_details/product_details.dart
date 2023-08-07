import 'package:flutter/material.dart';
import 'package:noble_jewelry/pages/product_details/product_details_sections.dart';
import 'package:noble_jewelry/shared/variables.dart';

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
            child: ProductSection(product: product ?? exampleProducts[0],),
          ),
          Divider(height: 100,),
          InfoDetailsSection()
        ],
      ),
    );
  }
}
