import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:noble_jewelry/models/collections.dart';

import '../models/product.dart';

const double kPagePadding = 100;

final Duration kAnimationSpeed = 120.milliseconds;

final Duration kAnimationDelay = 70.milliseconds;

final List<Product> exampleProducts = [
  Product(
      label: Labels.soldOut,
      collections: Collections.theBeginning,
      oldPriceUSD: 1299,
      image: Image.asset("lib/assets/images/bracelets/brace5.png"),
      name: "a",
      priceUSD: 999),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace6.png"),
      name: "b",
      priceUSD: 2),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace7.png"),
      name: "c",
      priceUSD: 3),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace8.png"),
      name: "d",
      priceUSD: 4),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace9.png"),
      name: "e",
      priceUSD: 5),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace5.png"),
      name: "f",
      priceUSD: 6),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace5.png"),
      name: "g",
      priceUSD: 7),
  Product(
      image: Image.asset("lib/assets/images/bracelets/brace5.png"),
      name: "h",
      priceUSD: 8),
];