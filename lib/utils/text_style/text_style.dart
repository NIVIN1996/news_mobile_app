import 'package:flutter/material.dart';

import '../color/colors.dart';



class TextFontStyle {
  static TextStyle lightFont({required Color color, required double size}) {
    return TextStyle(
        color: color, height: 1.2, fontWeight: FontWeight.w100, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle light({required Color color, required double size}) {
    return TextStyle(color: color, fontWeight: FontWeight.w300, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle regular({Color color = AppColor.black, required double size, double height = 1.4}) {
    return TextStyle(
        color: color, height: height, fontWeight: FontWeight.w400, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle normal({Color color = AppColor.black, required double size}) {
    return TextStyle(
      color: color,
      height: 1.2,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: size,
    );
  }

  static TextStyle semiBold({required Color color, required double size}) {
    return TextStyle(
        color: color, height: 1.2, fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle bold({required Color color, required double size}) {
    return TextStyle(
        color: color, height: 1.2, fontWeight: FontWeight.w700, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle highBold({required Color color, required double size}) {
    return TextStyle(
        color: color, height: 1.2, fontWeight: FontWeight.w800, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle large({required Color color, required double size}) {
    return TextStyle(
        color: color, height: 1.2, fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, fontSize: size);
  }

  static TextStyle med({required Color color, required double size}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        fontFamily: "Fjalla One",
        fontStyle: FontStyle.normal,
        fontSize: size);
  }
}
