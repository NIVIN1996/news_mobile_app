import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../models/category_model/category_model_navigation_params.dart';
import '../../models/country_based_news_model.dart';
import '../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../providers/theme_provider/theme_provider.dart';
import '../../services/api_services/news_list_services/news_list_services.dart';
import '../../utils/color/colors.dart';
import '../../utils/static/enums.dart';
import '../../utils/text_style/text_style.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  TopHeadlineNewsModel? politicsListModel;
  TopHeadlineNewsModel? businessListModel;
  TopHeadlineNewsModel? sportsListModel;
  TopHeadlineNewsModel? entertainmentListModel;
  TopHeadlineNewsModel? countryListModel;
  ApiStatus politicsListStatus = ApiStatus.none;
  ApiStatus businessListStatus = ApiStatus.none;
  ApiStatus sportsListStatus = ApiStatus.none;
  ApiStatus entertainmentListStatus = ApiStatus.none;
  ApiStatus countryListStatus = ApiStatus.none;
  String politicsListApiError = "";
  String businessListApiError = "";
  String sportsListApiError = "";
  String entertainmentListApiError = "";
  String countryListApiError = "";

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.easeIn,
            decoration: const BoxDecoration(
              color: AppColor.yellow,
            ),
            child: Text('News4U', style: TextFontStyle.med(color: AppColor.black, size: context.textPx * 24)),
          ),
          ExpansionTile(
            title: Text('Category', style: TextFontStyle.med(size: context.textPx * 20)),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Politics', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
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
                  ListTile(
                    title: Text('Business', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
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
                  ListTile(
                    title: Text('Sports', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
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
                  ListTile(
                    title: Text('Entertainment',
                        style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
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
            ],
          ),
          ExpansionTile(
            title: Text('Country', style: TextFontStyle.med(size: context.textPx * 20)),
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('India', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
                      context.pushNamed(
                        ScreenNames.newsCountryListScreen,
                        arguments: CountryNewsNavigationParameters(
                            category: "",countryCode: "in",
                           ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('US', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
                      context.pushNamed(
                        ScreenNames.newsCountryListScreen,
                        arguments: CountryNewsNavigationParameters(
                            category: "",
                            countryCode: "us",
                     ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Japan', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
                      context.pushNamed(
                        ScreenNames.newsCountryListScreen,
                        arguments: CountryNewsNavigationParameters(
                            category: "",
                            countryCode: "jp",
                          ),
                      );
                    },
                  ),
                  ListTile(
                    title: Text('Russia', style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16)),
                    onTap: () {
                      context.pushNamed(
                        ScreenNames.newsCountryListScreen,
                        arguments: CountryNewsNavigationParameters(
                            category: "",
                            countryCode: "ru",
                         ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          ListTile(
            title: Text('Profile Settings', style: TextFontStyle.med(size: context.textPx * 20)),
            onTap: () {
              context.pushNamed(ScreenNames.profileScreen);
            },
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark ? 'Dark Mode' : 'Light Mode',
                    style: TextFontStyle.med(size: context.textPx * 20)),
                Switch.adaptive(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      final provider = Provider.of<ThemeProvider>(context, listen: false);
                      provider.toggleTheme(value);
                    })
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('Terms and Conditions', style: TextFontStyle.med(size: context.textPx * 20)),
            onTap: () {
              context.pushNamed(ScreenNames.termsAndConditionScreen);
            },
          ),
          ListTile(
            title: Text('Rate Us', style: TextFontStyle.med(size: context.textPx * 20)),
            onTap: () {
              context.pushNamed(ScreenNames.rateUsScreen);
            },
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
