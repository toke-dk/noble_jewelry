import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noble_jewelry/pages/home.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/variables.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPagePadding),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "shop".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Theme.of(context).colorScheme.tertiary),
          ),
          Text(
            "Best Quality Bracelets".toUpperCase(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 25,
          ),
          Divider(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      const TextSpan(
                          text: "42 ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "Products")
                    ]),
              ),
              PrimaryButton(text: "Filter", onTap: () {}, icon: Icons.tune),
            ],
          ),
          Divider(height: 50,),
          GridView.count(
            shrinkWrap: true,
            childAspectRatio: (1 / 1.4),
            crossAxisCount: 4,
            children: List.generate(exampleProducts.length,
                (index) => ShowProduct(product: exampleProducts[index])),
          )
        ],
      ),
    );
  }
}
