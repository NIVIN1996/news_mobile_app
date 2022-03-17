import 'package:flutter/material.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:news_mobile_app/widgets/button_widget/custom_button_widget.dart';
import '../../models/top_news_headline_model/article_model.dart';
import '../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../services/api_services/news_list_services/news_list_services.dart';
import '../../services/api_services/search_news_service/search_news_service.dart';
import '../../utils/color/colors.dart';
import '../../utils/static/enums.dart';
import '../../utils/text_style/text_style.dart';
import '../../widgets/app_bar_widget/app_bar_widget.dart';
import '../../widgets/popup_widget/popup_widget.dart';
import '../menu_screen/menu_screen.dart';
import 'home_page_widget/category_widget/category_widget.dart';
import 'home_page_widget/news_list_widget/news_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextEditingController = TextEditingController();
  TopHeadlineNewsModel? topRelatedListModel;
  ApiStatus topRelatedListStatus = ApiStatus.none;
  String topRelatedListApiError = "";


  @override
  void initState() {
    _getTopHeadlineNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final styleActive = TextFontStyle.med(color: AppColor.black, size: context.textPx * 16);
    final styleHint = TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16);
    final style = _searchTextEditingController.text.isEmpty ? styleHint : styleActive;
    return Scaffold(
      drawer: const MenuScreen(),
      appBar: AppBarWidget(
        menuPress: () {
          Scaffold.of(context).openDrawer();
        },
        filterPress: () {
          showDialog(context: context, builder: (BuildContext context) => const PopUpWidget());
        },
        notificationPress: () {
          context.pushNamed(ScreenNames.notificationScreen);
        },
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: context.heightPx * 50,
                margin: EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                ),
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Expanded(
                      flex:3,
                      child: TextField(
                        controller: _searchTextEditingController,
                        decoration: InputDecoration(
                          icon: Icon(Icons.search, color: style.color),

                          contentPadding: EdgeInsets.symmetric(
                            vertical: context.heightPx * 12,
                          ),
                          hintStyle: style,
                          border: InputBorder.none,
                        ),
                        style: style,
                        onChanged: (searchText) {},
                      ),
                    ),
                     Expanded(
                      flex: 1,
                        child: CustomButton(label: "Search",onPress: (){
                          if(_searchTextEditingController.text.isEmpty){
                            _getTopHeadlineNews();
                          }else {
                            _getSearchNews();
                          }


                        },textColor: AppColor.grey5,
                        )),
                  ],
                ),
              ),
              const CategoryWidget(),
              NewsListWidget(
                apiError: topRelatedListApiError,
                status: topRelatedListStatus,
                model: topRelatedListModel,
                retryCallBack: _getTopHeadlineNews,
                isDelivered: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  _getTopHeadlineNews() async {
    setState(() {
      topRelatedListApiError = "";
      topRelatedListStatus = ApiStatus.loading;
    });

    topRelatedListModel = await NewsListingService.getTopNewsHeadlines();

    setState(() {
      if (topRelatedListModel!.status == "ok") {
        topRelatedListStatus = ApiStatus.success;
      } else {
        topRelatedListApiError = topRelatedListModel!.status;
        topRelatedListStatus = ApiStatus.error;
      }
    });
  }

  _getSearchNews() async {
    setState(() {
      topRelatedListApiError = "";
      topRelatedListStatus = ApiStatus.loading;
    });

    topRelatedListModel = await SearchNewsService.getSearchNews(_searchTextEditingController.text);

    setState(() {
      if (topRelatedListModel!.status == "ok") {
        topRelatedListStatus = ApiStatus.success;
      } else {
        topRelatedListApiError = topRelatedListModel!.status;
        topRelatedListStatus = ApiStatus.error;
      }
    });
  }
}
