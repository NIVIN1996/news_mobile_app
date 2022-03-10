import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

class CommonPadding {
  static EdgeInsetsGeometry paddingW25(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: context.widthPx * 25);
  }

  static EdgeInsetsGeometry paddingH10(BuildContext context) {
    return EdgeInsets.symmetric(vertical: context.heightPx * 10);
  }
}
