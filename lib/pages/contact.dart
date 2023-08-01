import 'package:flutter/material.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/textfield.dart';
import 'package:noble_jewelry/widgets/top_page_title.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 720),
      child: Column(
        children: [
          const TopPageTitle(
            headlineSmall: "contact",
            headlineLarge: "contact us here if you want",
            bodyText: "Phone: +45 12 34 56 78 | info@noble.com",
          ),
          const SizedBox(
            height: 90,
          ),
          Wrap(
            runSpacing: 20,
            children: [
              const Row(
                children: [
                  Expanded(child: PrimaryTextField(labelText: "Name *")),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: PrimaryTextField(labelText: "Email")),
                ],
              ),
              const PrimaryTextField(labelText: "Phone"),
              const PrimaryTextField(maxLines: 5,labelText: "Message *"),
              PrimaryButton(text: "send message".toUpperCase(), onTap: (){}),
            ],
          ),
        ],
      ),
    );
  }
}
