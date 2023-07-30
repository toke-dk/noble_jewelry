import 'package:flutter/material.dart';
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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: SvgPicture.asset("lib/assets/images/logo-vertical.svg"),
              ),
              Expanded(
                child: Container(
                  child:
                  SvgPicture.asset("lib/assets/images/logo-with-text.svg"),
                ),
              ),
              Container(
                child: SvgPicture.asset("lib/assets/images/logo-vertical.svg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
