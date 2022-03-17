import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../models/category_model/category_model_navigation_params.dart';
import '../../utils/text_style/text_style.dart';

class PopUpWidget extends StatelessWidget {
  const PopUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)), //this right here
      child: SizedBox(
        height: context.percentHeight * 50,
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
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: context.heightPx * 15),
                  width: double.infinity,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColor.grey5)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.widthPx * 10.0, vertical: context.heightPx * 10),
                    child: Text(
                      "Sort By Latest news",
                      textAlign: TextAlign.start,
                      style: TextFontStyle.regular(
                        size: context.textPx * 20,
                      ),
                    ),
                  ),
                ),
              ),
              ExpansionTile(
                title: Text('Choose Country', style: TextFontStyle.med(size: context.textPx * 20)),
                children: <Widget>[
                  SizedBox(
                    // height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text('India', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                            onTap: () {

                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text('US', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                            onTap: () {

                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: ListTile(
                            title: Text('Russia', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                            onTap: () {

                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: ListTile(
                            title: Text('Japan',
                                style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                            onTap: () {

                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
