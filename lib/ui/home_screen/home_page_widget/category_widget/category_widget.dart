import 'package:flutter/material.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../../models/category_model/category_model_navigation_params.dart';
import '../../../../models/top_news_headline_model/top_news_headline_model.dart';
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
  TopHeadlineNewsModel? politicsListModel;
  TopHeadlineNewsModel? businessListModel;
  TopHeadlineNewsModel? sportsListModel;
  TopHeadlineNewsModel? entertainmentListModel;
  ApiStatus politicsListStatus = ApiStatus.none;
  ApiStatus businessListStatus = ApiStatus.none;
  ApiStatus sportsListStatus = ApiStatus.none;
  ApiStatus entertainmentListStatus = ApiStatus.none;
  String politicsListApiError = "";
  String businessListApiError = "";
  String sportsListApiError = "";
  String entertainmentListApiError = "";
  @override
  void initState() {
    _getBusinessNews();
    _getPoliticsNews();
    _getEntertainmentNews();
    _getSportsNews();
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
                        category: "Politics",
                        callBack: _getPoliticsNews,
                        categoryListModel: politicsListModel,
                        categoryNewsStatus: politicsListStatus,
                        errorStatus: politicsListApiError),
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
                        callBack: _getBusinessNews,
                        categoryListModel: businessListModel,
                        categoryNewsStatus: businessListStatus,
                        errorStatus: businessListApiError),
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
                        callBack: _getSportsNews,
                        categoryListModel: sportsListModel,
                        categoryNewsStatus: sportsListStatus,
                        errorStatus: sportsListApiError),
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
                        callBack: _getEntertainmentNews,
                        categoryListModel: entertainmentListModel,
                        categoryNewsStatus: entertainmentListStatus,
                        errorStatus: entertainmentListApiError),
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

  _getBusinessNews() async {
    setState(() {
      businessListApiError = "";
      businessListStatus = ApiStatus.loading;
    });

    businessListModel = await NewsListingService.getBusinessNews();

    setState(() {
      if (businessListModel!.status == "ok") {
        businessListStatus = ApiStatus.success;
      } else {
        businessListApiError = businessListModel!.status;
        businessListStatus = ApiStatus.error;
      }
    });
  }

  _getPoliticsNews() async {
    setState(() {
      politicsListApiError = "";
      politicsListStatus = ApiStatus.loading;
    });

    politicsListModel = await NewsListingService.getPolitics();

    setState(() {
      if (politicsListModel!.status == "ok") {
        politicsListStatus = ApiStatus.success;
      } else {
        politicsListApiError = politicsListModel!.status;
        politicsListStatus = ApiStatus.error;
      }
    });
  }

  _getSportsNews() async {
    setState(() {
      sportsListApiError = "";
      sportsListStatus = ApiStatus.loading;
    });

    sportsListModel = await NewsListingService.getSports();

    setState(() {
      if (sportsListModel!.status == "ok") {
        sportsListStatus = ApiStatus.success;
      } else {
        sportsListApiError = sportsListModel!.status;
        sportsListStatus = ApiStatus.error;
      }
    });
  }

  _getEntertainmentNews() async {
    setState(() {
      entertainmentListApiError = "";
      entertainmentListStatus = ApiStatus.loading;
    });

    entertainmentListModel = await NewsListingService.getEntertainment();

    setState(() {
      if (entertainmentListModel!.status == "ok") {
        entertainmentListStatus = ApiStatus.success;
      } else {
        entertainmentListApiError = entertainmentListModel!.status;
        entertainmentListStatus = ApiStatus.error;
      }
    });
  }
}
