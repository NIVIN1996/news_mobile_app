import 'dart:math';
import 'package:flutter/cupertino.dart';

extension ResponsiveConfig on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get statusBarHeight => mq.padding.top;
  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;
  double get screenRatio => screenHeight / screenWidth;
  double get widthPx => screenWidth > 600 ? 1.5 : 1;
  double get heightPx => screenWidth > 600 ? 1.5 : 1;
  double get textPx => screenWidth > 600 ? 1.5 : 1;
  double get percentWidth => screenWidth / 100;
  double get percentHeight => screenHeight / 100;
}

//Size without context extension

class WindowProperties {
  static MediaQueryData mq = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);

  static double get statusBarHeight => mq.padding.top;
  static double get bottomBarHeight => mq.padding.bottom;
  static double get screenWidth => mq.size.width;
  static double get screenHeight => mq.size.height;
  static double get safeScreenHeight => mq.size.height - (statusBarHeight + bottomBarHeight);
  static double get screenRatio => screenHeight / screenWidth;
  static double get widthPx => screenWidth / _FigmaFileDetails.screenWidth;
  static double get heightPx => screenHeight / _FigmaFileDetails.screenHeight;
  static double get textPx =>
      min(screenWidth / _FigmaFileDetails.screenWidth, screenHeight / _FigmaFileDetails.screenHeight);
}

class _FigmaFileDetails {
  static const double screenWidth = 375;
  static const double screenHeight = 812;
}
