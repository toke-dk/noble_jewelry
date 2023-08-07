import 'package:flutter/material.dart';
import 'package:noble_jewelry/models/collections.dart';
import 'package:noble_jewelry/models/product.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/textfield.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1900,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: [
          const _ShowImages(
            images: [
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder()
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          Container(
              height: 825,
              width: 600,
              child: product.image),
          const Spacer(
            flex: 10,
          ),
          _ShowDetails(
            product: product,
          ),
          const Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}

class InfoDetailsSection extends StatelessWidget {
  const InfoDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1200,
      child: Row(
        children: [
          Text("Description".toUpperCase()),
          Spacer(),
          Expanded(child: Container(color:Colors.amber,child: Text("Features"))),
        ],
      ),
    );
  }
}


class _ShowImages extends StatelessWidget {
  const _ShowImages({Key? key, required this.images}) : super(key: key);
  final List<Widget> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 144,
      child: Column(
        children: List.generate(images.length, (index) {
          final Widget currentImage = images[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FittedBox(fit: BoxFit.fitHeight, child: currentImage),
          );
        }),
      ),
    );
  }
}

class _ShowDetails extends StatelessWidget {
  const _ShowDetails({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.collections?.getName ?? "Exclusive Leak".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.grey[600]),
              ),
              PrimaryButton(
                text: "",
                onTap: () {},
                onlyUnderline: true,
                outlined: true,
                trailingIcon: Icons.favorite_outline_sharp,
              ),
            ],
          ),
          Text(
            product.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "Size: "),
            TextSpan(
                text: product.size?.toString() ?? "One Size".toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold))
          ])),
          SizedBox(
            height: 20,
          ),
          Text("Quantity".toUpperCase()),
          MyInputQuantity(),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
              child:
                  PrimaryButton(text: "Ad To Cart".toUpperCase(), onTap: () {}))
        ],
      ),
    );
  }
}
