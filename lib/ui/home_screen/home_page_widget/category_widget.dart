import 'package:flutter/material.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/color/colors.dart';
import 'category_item_widget.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.widthPx * 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItemWidget(
                nextLine: false,
                label: "Politics",
                image: "assets/icons/politics.png",
                gridColor: AppColor.green3,
                onPress: () {
                  context.pushNamed(ScreenNames.newsCategoryListScreen,arguments: "Politics");
                },
              ),
              SizedBox(
                width: context.widthPx * 20,
              ),
              CategoryItemWidget(
                nextLine: false,
                label: 'Business',
                image: "assets/icons/stats.png",
                gridColor: AppColor.orange,
                onPress: () {
                  context.pushNamed(ScreenNames.newsCategoryListScreen,arguments: "Business");
                },
              ),
            ],
          ),
          SizedBox(
            height: context.heightPx * 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CategoryItemWidget(
                nextLine: false,
                label: "Sports",
                image: "assets/icons/sport.png",
                gridColor: AppColor.primaryColor3,
                onPress: () {
                  context.pushNamed(ScreenNames.newsCategoryListScreen,arguments: "Sports");
                },
              ),
              SizedBox(
                width: context.widthPx * 20,
              ),
              CategoryItemWidget(
                nextLine: false,
                label: "Entertainment",
                image: "assets/icons/cinema.png",
                gridColor: AppColor.yellow2,
                onPress: () {
                  context.pushNamed(ScreenNames.newsCategoryListScreen,arguments: "Entertainment");

                },
              ),
            ],
          ),
          SizedBox(
            height: context.heightPx * 20,
          ),
        ],
      ),
    );
  }
}
