import 'package:flutter/material.dart';
import 'package:noble_jewelry/models/product.dart';

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
            images: [Placeholder(), Placeholder(), Placeholder(), Placeholder()],
          ),
          const Spacer(flex: 3,),
          Container(
            height: 825,
            color: Colors.red,
              width: 600,
              child: const Placeholder()),
          const Spacer(flex: 10,),
          _ShowDetails(product: product,),
          const Spacer(flex: 10,),
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
    return const SizedBox(
      width: 400,
      child: Column(
        children: [
          Row(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}
