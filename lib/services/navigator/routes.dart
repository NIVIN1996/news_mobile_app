import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/change_password_screen/change_password_screen.dart';
import 'package:news_mobile_app/ui/forgot_password_screen/forgot_password_screen.dart';
import 'package:news_mobile_app/ui/login_screen/login_screen.dart';
import 'package:news_mobile_app/ui/menu_screen/menu_screen.dart';

import '../../ui/home_screen/home_screen.dart';
import '../../ui/language_screen/choose_language_screen.dart';
import '../../ui/registration_screen/registration_screen.dart';

class ScreenNames {
  static String currentRoute = "/";
  static const String login = "ui/login_screen/login_screen";
  static const String chooseLanguageScreen = "ui/signup_screen/chooseLanguageScreen";
  static const String registrationScreen = "ui/registration_screen/registration_screen";
  static const String forgotPasswordScreen = "ui/forgot_password_screen/forgot_password_screen";
  static const String changePasswordScreen = "ui/change_password_screen/change_password_screen";
  static const String homeScreen = "ui/home_screen/home_screen";
  static const String menuScreen = "ui/menu_screen/menu_screen";

}

Route<dynamic> generateRoute(RouteSettings settings) {
  ScreenNames.currentRoute = settings.name!;

  switch (settings.name) {
    case ScreenNames.login:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case ScreenNames.registrationScreen:
      return MaterialPageRoute(builder: (context) => const RegistrationScreen());
    case ScreenNames.chooseLanguageScreen:
      return MaterialPageRoute(builder: (context) => const ChooseLanguageScreen());
    case ScreenNames.forgotPasswordScreen:
      return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());
    case ScreenNames.changePasswordScreen:
      return MaterialPageRoute(builder: (context) => const ChangePasswordScreen());
    case ScreenNames.homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case ScreenNames.menuScreen:
      return MaterialPageRoute(builder: (context) => const MenuScreen());

    default:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
