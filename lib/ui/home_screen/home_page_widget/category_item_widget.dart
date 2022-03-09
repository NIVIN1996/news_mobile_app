import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/text_style/text_style.dart';

class CategoryItemWidget extends StatelessWidget {
  final String image;
  final String label;
  final String secondLabel;
  final bool nextLine;
  final Color gridColor;

  final void Function() onPress;
  const CategoryItemWidget(
      {Key? key,
      required this.image,
      required this.label,
      required this.onPress,
      this.secondLabel = "",
      required this.nextLine,
      required this.gridColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: (context.screenWidth - context.widthPx * 100) / (context.screenWidth > 600 ? 2.13 : 2.5),
        width: (context.screenWidth - context.widthPx * 40) / (context.screenWidth > 600 ? 2.13 : 2.2),
        // margin: EdgeInsets.only(left: commonHPadding(context)/2,right: commonHPadding(context)/2, top: context.widthPx * 10,bottom: context.widthPx * 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: FractionalOffset.center,
                child: Transform.scale(
                  scale: context.screenWidth > 600 ? 1.5 : 1,
                  child: Image.asset(
                    image,
                    width: context.widthPx * 100,
                    height: context.heightPx * 50,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: context.heightPx * 25.0,
                ),
                child: Column(
                  children: [
                    Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 16),
                    ),
                    nextLine == true
                        ? Text(
                            secondLabel,
                            textAlign: TextAlign.center,
                            style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 16),
                          )
                        : const SizedBox(),
                  ],
                ), //Your widget here,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: gridColor,
            boxShadow: const [
              BoxShadow(
                color: AppColor.grey5,
                blurRadius: 5.0,
              ),
            ],
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
