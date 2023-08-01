import 'package:flutter/material.dart';

class TopPageTitle extends StatelessWidget {
  const TopPageTitle(
      {Key? key,
      required this.headlineSmall,
      required this.headlineLarge,
      this.centerText})
      : super(key: key);

  final String headlineSmall;
  final String headlineLarge;
  final bool? centerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headlineSmall.toUpperCase(),
          textAlign: centerText == true ? TextAlign.center : null,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Theme.of(context).colorScheme.tertiary),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          headlineLarge.toUpperCase(),
          textAlign: centerText == true ? TextAlign.center : null,
          style: Theme.of(context).textTheme.headlineLarge,
        ),

      ],
    );
  }
}
