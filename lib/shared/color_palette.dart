import 'package:flutter/material.dart';

// this page https://maketintsandshades.com/
class Palette {
  static const MaterialColor kPrimaryMaterialColor = MaterialColor(
    0xff2a493e, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff3c6858),//10%
      100: Color(0xff507769),//20%
      200: Color(0xff638679),//30%
      300: Color(0xff77958a),//40%
      400: Color(0xff8aa49b),//50%
      500: Color(0xff9eb4ac),//60%
      600: Color(0xffb1c3bc),//70%
      700: Color(0xffc5d2cd),//80%
      800: Color(0xffd8e1de),//90%
      900: Color(0xffecf0ee),//100%
    },
  );
}