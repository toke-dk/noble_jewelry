import 'package:flutter/material.dart';
import 'package:noble_jewelry/widgets/top_page_title.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
            width: 700,
            child: TopPageTitle(
              centerText: true,
              headlineSmall: 'About',
              headlineLarge:
                  'From Forest to Fashion:\nThe Journey of Our Exclusive Bracelets',
            ))
      ],
    );
  }
}
