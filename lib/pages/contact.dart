import 'package:flutter/material.dart';
import 'package:noble_jewelry/widgets/top_page_title.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopPageTitle(headlineSmall: "contact", headlineLarge: "contact us here if you want", bodyText: "Phone: +45 12 34 56 78 | info@noble.com",)
      ],
    );
  }
}
