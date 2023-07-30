import  'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:noble_jewelry/shared/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPagePadding),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    child: SvgPicture.asset("lib/assets/images/logo/logo-vertical.svg"),
                  ),
                  Expanded(
                    child: Container(
                      child:
                      SvgPicture.asset("lib/assets/images/logo/logo-with-text.svg"),
                    ),
                  ),
                  Container(
                    child: SvgPicture.asset("lib/assets/images/logo/logo-vertical.svg"),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(child: Image.asset("lib/assets/images/bracelets/brace1.png")),
                  Column(
                    children: [
                      Text("Nature's finesse on your wrist"),
                      Text("Explore Our High-Quality Wood Bracelets"),
                      Placeholder()
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
