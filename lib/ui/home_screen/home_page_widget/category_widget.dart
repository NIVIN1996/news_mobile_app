import 'package:flutter/material.dart';
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
      color: AppColor.whiteColor,
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
                onPress: () {},
              ),
              SizedBox(
                width: context.widthPx * 20,
              ),
              CategoryItemWidget(
                nextLine: false,
                label: 'Business',
                image: "assets/icons/stats.png",
                gridColor: AppColor.orange,
                onPress: () {},
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
                onPress: () {},
              ),
              SizedBox(
                width: context.widthPx * 20,
              ),
              CategoryItemWidget(
                nextLine: false,
                label: "Entertainment",
                image: "assets/icons/cinema.png",
                gridColor: AppColor.yellow2,
                onPress: () {},
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
