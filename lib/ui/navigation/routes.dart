import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/models/news_details_model/news_details_navigation_params.dart';
import 'package:news_mobile_app/ui/bookmark_list_screen/bookmark_list_screen.dart';
import 'package:news_mobile_app/ui/change_password_screen/change_password_screen.dart';
import 'package:news_mobile_app/ui/forgot_password_screen/forgot_password_screen.dart';
import 'package:news_mobile_app/ui/login_screen/login_screen.dart';
import 'package:news_mobile_app/ui/menu_screen/menu_screen.dart';
import 'package:news_mobile_app/ui/notification_screen/notification_screen.dart';
import 'package:news_mobile_app/ui/rate_us_screen/rate_us_screen.dart';
import 'package:news_mobile_app/ui/terms_and_condition_screen/terms_and_condition_screen.dart';
import '../../models/category_model/category_model_navigation_params.dart';
import '../../models/country_based_news_model.dart';
import '../home_screen/home_screen.dart';
import '../language_screen/choose_language_screen.dart';
import '../news_category_list_screen/news_category_list_screen.dart';
import '../news_country_list_screen/news_country_list_screen.dart';
import '../news_details_screen/news_details_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../registration_screen/registration_screen.dart';

class ScreenNames {
  static String currentRoute = "/";
  static const String login = "ui/login_screen/login_screen";
  static const String chooseLanguageScreen = "ui/signup_screen/chooseLanguageScreen";
  static const String registrationScreen = "ui/registration_screen/registration_screen";
  static const String forgotPasswordScreen = "ui/forgot_password_screen/forgot_password_screen";
  static const String changePasswordScreen = "ui/change_password_screen/change_password_screen";
  static const String homeScreen = "ui/home_screen/home_screen";
  static const String menuScreen = "ui/menu_screen/menu_screen";
  static const String newsDetailsScreen = "ui/news_details_screen/news_details_screen";
  static const String termsAndConditionScreen = "ui/terms_and_condition_screen/terms_and_condition_screen";
  static const String newsCategoryListScreen = "ui/news_category_list_screen/news_category_list_screen";
  static const String notificationScreen = "ui/notification_screen/notification_screen";
  static const String rateUsScreen = "ui/rate_us_screen/rate_us_screen";
  static const String profileScreen = "ui/profile_screen/profile_screen";
  static const String newsCountryListScreen = "ui/news_country_list_Screen/news_country_list_Screen";
  static const String bookmarkListScreen = "ui/bookmark_list_screen/bookmark_list_screen";
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
      return MaterialPageRoute(builder: (context) =>   HomeScreen(user: settings.arguments as User?,

      ));
    case ScreenNames.menuScreen:
      return MaterialPageRoute(builder: (context) =>  MenuScreen(currentUser: settings.arguments as User,));
    case ScreenNames.newsDetailsScreen:
      return MaterialPageRoute(
          builder: (context) => NewsDetailsScreen(
            navigationParameters: settings.arguments as NewsDetailsNavigationParameters,
              ));
    case ScreenNames.termsAndConditionScreen:
      return MaterialPageRoute(builder: (context) => const TermsAndConditionScreen());
    case ScreenNames.newsCategoryListScreen:
      return MaterialPageRoute(
          builder: (context) => NewsCategoryListScreen(
                navigationParameters: settings.arguments as CategoryNewsNavigationParameters,
              ));
    case ScreenNames.rateUsScreen:
      return MaterialPageRoute(builder: (context) => const RateUsScreen());
    case ScreenNames.profileScreen:
      return MaterialPageRoute(builder: (context) =>  ProfileScreen(user: settings.arguments as User?,));
    case ScreenNames.notificationScreen:
      return MaterialPageRoute(builder: (context) => const NotificationScreen());
    case ScreenNames.bookmarkListScreen:
      return MaterialPageRoute(builder: (context) => const BookmarkListScreen());
    case ScreenNames.newsCountryListScreen:
      return MaterialPageRoute(builder: (context) =>  NewsCountryListScreen(
        navigationParameters: settings.arguments as CountryNewsNavigationParameters,
      ));

    default:
      return MaterialPageRoute(builder: (context) =>   HomeScreen(user: settings.arguments as User, ));
  }
}
