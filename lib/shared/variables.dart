import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:noble_jewelry/models/collections.dart';

import '../models/product.dart';
import '../widgets/sections.dart';

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
];

final List<Journal> placeHolderJournals = [
  Journal(date: DateTime.now(),
      title: "Example Jounal That Should Be Read",
      coverImage: Placeholder(),
      theme: JournalThemes.people,
      description: "This is a pure example"
  ),
  Journal(date: DateTime.now(),
      title: "This Is Really Interesting",
      coverImage: Placeholder(),
      theme: JournalThemes.events,
      description: "It really is",
  ),
  Journal(date: DateTime.now(),
    title: "Oh You Should Read This",
    coverImage: Placeholder(),
    theme: JournalThemes.products,
    description: "Super New Pruduct",
  ),
  Journal(date: DateTime.now(),
    title: "Agaiiin",
    coverImage: Placeholder(),
    theme: JournalThemes.products,
    description: "Ultra",
  ),
];