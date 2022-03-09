import 'package:flutter/material.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/responsive_config/responsive_config.dart';


class AppBarSize {
  AppBarSize();

  static double tabToolbarHeight = 100;
  static double tabAppbarHeight = 100;

  static double appBarHeight(AppBar appBar) {
    double screenWidth = WindowProperties.screenWidth;
    if (screenWidth > 600) {
      return tabAppbarHeight;
    } else {
      return appBar.preferredSize.height;
    }
  }

  static double toolbarHeight(AppBar appBar) {
    double screenWidth = WindowProperties.screenWidth;
    if (screenWidth > 600) {
      return tabToolbarHeight;
    } else {
      return kToolbarHeight;
    }
  }

  static double menuIconWidth(BuildContext context) {
    return context.widthPx * 23;
  }

  static double notificationIconWidth(BuildContext context) {
    return context.widthPx * 23;
  }

  static double leadingPaddingSize(BuildContext context) {
    double pad = context.widthPx * 20;
    if (context.screenWidth > 600) {
      pad = 10;
    }
    return pad;
  }
  static EdgeInsets leadingPadding(BuildContext context) {
    return  EdgeInsets.only(
      left: AppBarSize.leadingPaddingSize(context),
    );
  }

  static double tailingPaddingSize(BuildContext context) {
    double pad = context.widthPx * 30;
    if (context.screenWidth > 600) {
      pad = 45;
    }
    return pad;
  }

  static EdgeInsets tailingPadding(BuildContext context) {
    return  EdgeInsets.only(
      right: AppBarSize.tailingPaddingSize(context),

    );
  }

  static double iconScale() {
    double screenWidth = WindowProperties.screenWidth;
    if (screenWidth > 600) {
      return 1.5;
    } else {
      return 1.0;
    }
  }

  //! ** Icon Widgets

  static Widget menuIconWidget(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      child: Transform.scale(
        scale: iconScale(),
        child: Image.asset(
          "assets/icons/menu.png",

          fit: BoxFit.scaleDown,
          width: AppBarSize.menuIconWidth(context),
        ),
      ),
    );
  }

  static Widget filterIconWidget(BuildContext context) {
    return Transform.scale(
      scale: iconScale(),
      child: const Icon(Icons.tune,color: AppColor.black,)
    );
  }

  static Widget notificationIconWidget(BuildContext context) {
    return Transform.scale(
      scale: iconScale(),
      child: Image.asset(
        "assets/icons/notification.png",
        fit: BoxFit.scaleDown,
        //! Notification icon responsive height
        width: AppBarSize.notificationIconWidth(context),
      ),
    );
  }

//! ** End Icons Widgets
}
