import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/ui/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:news_mobile_app/ui/widgets/button_widget/search_button.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/color/colors.dart';
import '../../utils/static/enums.dart';
import '../../utils/text_style/text_style.dart';
import '../menu_screen/menu_screen.dart';
import '../widgets/common_text_widget/highlight_text_widget.dart';
import '../widgets/shimmer_widget/shimmer_widget.dart';
import 'home_page_widget/category_widget/category_widget.dart';
import 'home_page_widget/news_list_widget/news_list_item_widget.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({Key? key, required this.user }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextEditingController = TextEditingController();
  TopHeadlineNewsModel? topRelatedListModel;
  ApiStatus topRelatedListStatus = ApiStatus.none;
  String topRelatedListApiError = "";
  late User? _currentUser;
  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
    Future.delayed(Duration.zero, () {
      context.read<ArticleListProvider>().getArticle();
    });
  }


  @override
  Widget build(BuildContext context) {
    final styleActive = TextFontStyle.med(color: AppColor.black, size: context.textPx * 16);
    final styleHint = TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 16);
    final style = _searchTextEditingController.text.isEmpty ? styleHint : styleActive;

    return Scaffold(
      drawer:  MenuScreen(currentUser:_currentUser),
      appBar: AppBarWidget(
        menuPress: () {
          Scaffold.of(context).openDrawer();
        },
        notificationPress: () {
          context.pushNamed(ScreenNames.bookmarkListScreen);
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
                      flex: 3,
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
                        child: SearchButton(
                          label: "Search",
                          onPress: () {
                            if (_searchTextEditingController.text.isEmpty) {
                              context.read<ArticleListProvider>().getArticle();
                            } else {
                              context.read<ArticleListProvider>().getSearchArticle(_searchTextEditingController.text);
                            }
                          },
                          textColor: AppColor.black,
                        )),
                  ],
                ),
              ),
              const CategoryWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HighLightTextWidget(),
                  Consumer<ArticleListProvider>(builder: (context, provider, _) {
                    if (provider.articleInitStatus == ApiStatus.loading) {
                      return Column(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.widthPx * 25.0, vertical: context.heightPx * 10),
                              child: ShimmerWidget(
                                height: context.heightPx * 140,
                                width: double.infinity,
                                radius: 10,
                              ),
                            )
                        ],
                      );
                    }
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: context.heightPx * 5.0),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: provider.articleInitStatus == ApiStatus.success
                              ? (_searchTextEditingController.text.isEmpty
                                  ? provider.articleList.length
                                  : provider.searchArticleList.length)
                              : 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return provider.articleInitStatus == ApiStatus.success
                                ? NewsListItemWidget(
                                    title: _searchTextEditingController.text.isEmpty
                                        ? provider.articleList[index].title
                                        : provider.searchArticleList[index].title,
                                    imageUrl: _searchTextEditingController.text.isEmpty
                                        ? provider.articleList[index].urlToImage
                                        : provider.searchArticleList[index].urlToImage,
                                    publishedAt: _searchTextEditingController.text.isEmpty
                                        ? provider.articleList[index].publishedAt!
                                        : provider.searchArticleList[index].publishedAt!,
                                    subTitle: _searchTextEditingController.text.isEmpty
                                        ? provider.articleList[index].content
                                        : provider.searchArticleList[index].content,
                                    index: index,
                                    author: _searchTextEditingController.text.isEmpty
                                        ? provider.articleList[index].source.name
                                        : provider.searchArticleList[index].source.name,
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: context.widthPx * 25.0, vertical: context.heightPx * 10),
                                    child: ShimmerWidget(
                                      height: context.heightPx * 140,
                                      width: context.widthPx * 100,
                                      radius: 10,
                                    ),
                                  );
                          }),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }




}
