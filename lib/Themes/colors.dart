import 'package:flutter/material.dart';

Color kMainColor = HexColor.fromHex("#F3CFC6");
Color kDisabledColor = const Color(0xff616161);
Color kWhiteColor = Colors.white;
Color kLightTextColor = Colors.grey;
Color kCardBackgroundColor = const Color(0xfff8f9fd);
Color kTransparentColor = Colors.transparent;
Color kHintColor = const Color(0xff999e93);
Color kTextColor = const Color(0xff6a6c74);
Color kMainTextColor = const Color(0xff000000);

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opactiy 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
