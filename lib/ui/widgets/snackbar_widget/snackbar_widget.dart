import 'package:flutter/material.dart';

import '../../../utils/color/colors.dart';

class AppSnackBar {
  static void showSnackBarWithText(
      {required BuildContext context,
        required String text,
        Duration? duration,
        Color? backgroundColor,
        SnackBarBehavior? behavior,
        Color? textColor}) {
    duration ??= const Duration(milliseconds: 2100);
    backgroundColor ??= AppColor.yellow2;
    textColor ??= AppColor.black;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: behavior ?? SnackBarBehavior.floating));
  }
}