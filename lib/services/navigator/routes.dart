import 'package:flutter/material.dart';

import '../../ui/home_screen/home_screen.dart';
import '../../ui/language_screen/choose_language_screen.dart';
import '../../ui/registration_screen/registration_screen.dart';


class ScreenNames {
  static String currentRoute = "/";
  static const String login = "ui/signup_screen/login_screen";
  static const String chooseLanguageScreen = "ui/signup_screen/chooseLanguageScreen";
  static const String homeScreen = "ui/home_screen/home_screen";
  static const String registrationScreen = "ui/registration_screen/registration_screen";



}

Route<dynamic> generateRoute(RouteSettings settings) {
  ScreenNames.currentRoute = settings.name!;

  switch (settings.name) {
    case ScreenNames.login:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case ScreenNames.chooseLanguageScreen:
      return MaterialPageRoute(builder: (context) => const ChooseLanguageScreen());
    case ScreenNames.registrationScreen:
      return MaterialPageRoute(builder: (context) => const RegistrationScreen());


    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
