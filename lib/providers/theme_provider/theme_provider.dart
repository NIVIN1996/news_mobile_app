import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/color/colors.dart';

import '../../utils/text_style/text_style.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primarySwatch: Colors.grey,
    shadowColor: Colors.grey.shade900,
    backgroundColor: AppColor.buttonActive,
    focusColor: Colors.grey,
    cardTheme: const CardTheme(shadowColor: AppColor.grey5),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      titleTextStyle: TextFontStyle.med(color: AppColor.whiteColor, size: 15),
      iconTheme: const IconThemeData(
        color: AppColor.whiteColor,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Colors.grey,
    ),
  );
  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    shadowColor: Colors.grey.shade900,
    cardTheme: const CardTheme(shadowColor: AppColor.lightBlue),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.whiteColor,
      titleTextStyle: TextFontStyle.med(color: AppColor.black, size: 15),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.grey,
    ),
  );
}
