import 'package:flutter/material.dart';
import 'package:noble_jewelry/models/collections.dart';
import 'package:noble_jewelry/models/pageProvider.dart';
import 'package:noble_jewelry/shared/number_convert.dart';
import 'package:noble_jewelry/widgets/sections.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../shared/buttons.dart';

class ShowProduct extends StatefulWidget {
  const ShowProduct(
      {Key? key, required this.product, this.alignment, this.onProductTap})
      : super(key: key);
  final Product product;
  final Alignment? alignment;
  final Function(Product)? onProductTap;

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.alignment ?? Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        constraints: const BoxConstraints(
          maxWidth: 270,
          minWidth: 270,
          maxHeight: 540,
          minHeight: 540,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            widget.product.label != null
                ? Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: Text(
                        widget.product.label!.getName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                : const SizedBox(),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 65, bottom: 30, right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.product.collections != null
                        ? Center(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 12),
                              width: 134,
                              height: 21,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text(
                                widget.product.collections!.getName,
                                style: Theme.of(context).textTheme.bodySmall,
                              )),
                            ),
                          )
                        : const SizedBox(),
                    HoverScaleWidget(start: 0.8, scaleFactor: 1, child: widget.product.image),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.product.name,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.product.priceUSD.convertDoublePriceToString,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        widget.product.oldPriceUSD != null
                            ? Text(
                                widget.product.oldPriceUSD!
                                    .convertDoublePriceToString,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    PrimaryButton(
                      outlined: true,
                      text: 'Discover'.toUpperCase(),
                      onTap: () {
                        Provider.of<PageProvider>(context, listen: false)
                            .setCurrentPage(Pages.productDetails);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
