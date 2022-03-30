import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_preference/theme_preference.dart';
import '../../utils/text_style/text_style.dart';

class ThemeProvider extends ChangeNotifier {
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false ;
  bool get darkTheme=>_darkTheme;

  set darkTheme (bool value){
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
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
