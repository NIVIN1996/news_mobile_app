import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../utils/text_style/text_style.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), //this right here
      child: SizedBox(
        height: context.percentHeight * 30,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sort By",
                textAlign: TextAlign.center,
                style: TextFontStyle.semiBold(size: context.textPx * 20),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical:context.heightPx* 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.grey5)

                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:context.widthPx* 10.0,vertical:context.heightPx* 10),
                  child: Text(
                    "Sort By Latest news",
                    textAlign: TextAlign.start,
                    style: TextFontStyle.regular(size: context.textPx * 20,),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical:context.heightPx* 5),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.grey5)

                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:context.widthPx* 10.0,vertical:context.heightPx* 10),
                  child: Text(
                    "Sort By Latest news",
                    textAlign: TextAlign.start,
                    style: TextFontStyle.regular(size: context.textPx * 20,),
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
