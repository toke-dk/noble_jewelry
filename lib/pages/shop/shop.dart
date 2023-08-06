import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noble_jewelry/pages/shop/show_items_in_shop.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/variables.dart';
import 'package:noble_jewelry/widgets/top_page_title.dart';

import '../../widgets/show_product.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1600,
      child: Column(
        children: [
          const TopPageTitle(
              headlineSmall: "Shop", headlineLarge: "Best Quality Bracelets"),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: const [
                      TextSpan(
                          text: "42 ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "Products")
                    ]),
              ),
              PrimaryButton(
                text: "Filter",
                onTap: () {},
                trailingIcon: Icons.tune,
                outlined: true,
              ),
            ],
          ),
          const Divider(
            height: 50,
          ),
          ShowItemsInShop(products: exampleProducts)
        ],
      ),
    );
  }
}
