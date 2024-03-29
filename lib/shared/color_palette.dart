import 'package:flutter/material.dart';

// this page https://maketintsandshades.com/
class Palette {
  static const MaterialColor kPrimaryMaterialColor = MaterialColor(
    0xff000000, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff000000),//10%
      100: Color(0xff1a1a1a),//20%
      200: Color(0xff333333),//30%
      300: Color(0xff4d4d4d),//40%
      400: Color(0xff666666),//50%
      500: Color(0xff808080),//60%
      600: Color(0xff999999),//70%
      700: Color(0xffb3b3b3),//80%
      800: Color(0xffcccccc),//90%
      900: Color(0xffe6e6e6),//100%
    },
  );
}