import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/text_style/text_style.dart';


class SearchButton extends StatelessWidget {
  final String label;
  final Function()? onPress;
  final bool disable;
  final Color color;
  final double height;
  final Color disabledColor;
  final Color textColor;
  final double radius;
  final double textSize;

  const SearchButton(
      {Key? key,
      required this.label,
      this.disable = false,
      this.color = AppColor.yellow,
      this.disabledColor = Colors.black,
      this.height = 60,
      this.radius = 10,
      this.textSize = 20,
      this.onPress,
      this.textColor = AppColor.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: context.heightPx * height,
        child: IgnorePointer(
          ignoring: disable,
          child: TextButton(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextFontStyle.med(
                  color: disable
                      ? disabledColor
                      : (onPress == null)
                          ? disabledColor
                          : textColor,
                  size: context.textPx * textSize),
            ),
            style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(9),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(9)),
                ),
                primary: Colors.black,
                backgroundColor: color,
                enableFeedback: false),
            onPressed: disable ? null : onPress,
          ),
        ));
  }
}
