import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';

import '../../../../models/category_model/category_model_navigation_params.dart';
import '../../../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../../../providers/news_list_provider/news_list_provider.dart';
import '../../../../services/api_services/news_list_services/news_list_services.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/static/enums.dart';
import 'category_item_widget.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  void initState() {
    super.initState();
  }

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
                  context.pushNamed(
                    ScreenNames.newsCategoryListScreen,
                    arguments: CategoryNewsNavigationParameters(
                        category: "politics",
                    ),
                  );
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
                  context.pushNamed(
                    ScreenNames.newsCategoryListScreen,
                    arguments: CategoryNewsNavigationParameters(
                        category: "Business",

                    ),
                  );
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
                  context.pushNamed(
                    ScreenNames.newsCategoryListScreen,
                    arguments: CategoryNewsNavigationParameters(
                        category: "Sports",
                    ),
                  );
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
                  context.pushNamed(
                    ScreenNames.newsCategoryListScreen,
                    arguments: CategoryNewsNavigationParameters(
                        category: "Entertainment",
                    ),
                  );
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
