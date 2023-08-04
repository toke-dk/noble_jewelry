import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:noble_jewelry/shared/buttons.dart';
import 'package:noble_jewelry/shared/variables.dart';
import '../widgets/sections.dart';
import '../widgets/show_product.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static const double contentSpacing = 100;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TOPBANNER
        SizedBox(
            height: 720,
            child: ImageBanner(
              title:
                  "Sophistication Unveiled, Nobility Redefined".toUpperCase(),
              subtitle:
                  "Elevate your style with our high-quality, high-status bracelets. Make a statement of sophistication and class."
                      .toUpperCase(),
              buttonText: "Shop Now".toUpperCase(),
              onArrowPress: () {},
              image: Image.asset(
                "lib/assets/images/about_images/wood-tree.png",
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: contentSpacing,
        ),

        /// MOST POPULAR PRODUCTS
        Column(
          children: [
            Center(
                child: Text("Most popular".toUpperCase(),
                    style: Theme.of(context).textTheme.headlineLarge!)),
            Center(
                child: Text(
              "Discover the Irresistible Favorites: Unmatched in Quality and Admired by All!",
              style: Theme.of(context).textTheme.bodyMedium!,
            )),
            const SizedBox(
              height: 30,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4,
                      (index) => ShowProduct(product: exampleProducts[index])),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: contentSpacing,
        ),

        /// NEW COLLECTION SECTION
        Center(
          child: ImageWithText(
            image:
                const SizedBox(width: 100, height: 100, child: Placeholder()),
            bodyText:
                '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla',
            title: 'COLLECTION “Victorian Nobility” COMING SOON'.toUpperCase(),
            button: PrimaryButton(
              outlined: true,
              text: "Early Acess".toUpperCase(),
              onTap: () {},
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),

        /// FEATURED COLLECTION SECTION
        Center(
          child: Text(
            "FEATURED COLLECTION".toUpperCase(),
            style: textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Center(
          child: SizedBox(
            width: 1400,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    3,
                    (index) => Column(
                          children: [
                            const Placeholder(),
                            PrimaryButton(
                              text: "Noble Origins".toUpperCase(),
                              onTap: () {},
                              onlyUnderline: true,
                              outlined: true,
                              trailingIcon: Icons.chevron_right,
                            )
                          ],
                        ))),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),

        /// NEW ARRIVALS SECTION
        Center(
          child: Text(
            "New arrivals".toUpperCase(),
            style: textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        const MultiRow(),
        const SizedBox(
          height: contentSpacing,
        ),

        /// WE ARE NOBLE BANNER
        SizedBox(
            height: 560,
            child: ImageBanner(
              title: "We are noble".toUpperCase(),
              subtitle:
                  "found out who we are and what we stand for".toUpperCase(),
              buttonText: "About us".toUpperCase(),
              image: Image.asset(
                "lib/assets/images/about_images/handshake.png",
                fit: BoxFit.cover,
              ),
            )),
        const SizedBox(
          height: contentSpacing,
        ),

        /// COMMUNITY SECTION
        Center(
          child: Text(
            "Community".toUpperCase(),
            style: textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: 36,
        ),
        Center(
            child: MultiColumn(
              sections: [
                MultiColumnSection(
                    title: "Building a Strong Foundation through Valued Customers",
                    bodyText:
                    "Our success is thanks to our valued customers. This community continues to expand, creating a close-knit atmosphere akin to a small family. Our success is thanks to our valued customers. This community continues to expand, creating a close-knit atmosphere akin to a small family."),
                MultiColumnSection(
                    title: "Building a Close-Knit Community",
                    bodyText:
                    "NOBLE has fostered a thriving community of like-minded individuals. As customers became part of our family, they discovered a space where bonds were forged and friendships flourished. Our community members share not only their love for our brand but also their passions, interests, and aspirations. Through engaging forums, events, and social media platforms, we have created a place where connections are nurtured, making our brand more than just a product, but an enriching lifestyle."),
                MultiColumnSection(
                    title: "Empowering Growth Together",
                    bodyText:
                    "The synergy between our brand and our community has empowered us to grow and evolve together. We actively seek feedback and suggestions from our community members, valuing their insights as we shape the future of [Brand Name]. Their advocacy and word-of-mouth support have allowed us to expand our family, welcoming new customers who resonate with our shared values. Together, we forge ahead on a journey of growth and success, united by the spirit of community and mutual support"),
              ],
            )),
        Center(
          child: PrimaryButton(
            text: "Be a part of the community".toUpperCase(),
            trailingIcon: Icons.chevron_right,
            onTap: () {},
            onlyUnderline: true,
            outlined: true,
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        
        Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/images/bracelets/brace1.png"),
                const SizedBox(
                  width: 80,
                ),
                Flexible(
                  child: Container(
                    width: 350,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nature's finesse on your wrist".toUpperCase(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "Explore Our High-Quality Wooden Bracelets"
                              .toUpperCase(),
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        PrimaryButton(
                          text: "shop now".toUpperCase(),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: Container(
            height: 460,
            constraints: const BoxConstraints(maxWidth: 800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Collection "시작" coming soon'.toUpperCase(),
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla",
                          overflow: TextOverflow.clip,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        PrimaryButton(
                          outlined: true,
                          text: "preorder".toUpperCase(),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                          right: 0,
                          top: 12,
                          child: Image.asset(
                              "lib/assets/images/bracelets/brace3.png")),
                      Positioned(
                          left: 0,
                          top: 0,
                          child: Image.asset(
                              "lib/assets/images/bracelets/brace4.png")),
                      Positioned(
                          left: 6,
                          bottom: 8,
                          child: Image.asset(
                              "lib/assets/images/bracelets/brace2.png")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: contentSpacing,
        ),
        Center(
          child: SizedBox(
            height: 1000,
            width: 1100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About Us".toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          PrimaryButton(
                              text: "About page".toUpperCase(), onTap: () {})
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla"),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                          "lib/assets/images/about_images/woodcraft.png")
                    ],
                  ),
                ),
                SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          "lib/assets/images/about_images/handshake.png"),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contact Us".toUpperCase(),
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          PrimaryButton(
                              text: "Contact page".toUpperCase(), onTap: () {})
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla"),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
