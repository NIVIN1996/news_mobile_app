import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import '../../models/country_based_news_model.dart';
import '../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/static/enums.dart';
import '../home_screen/home_page_widget/news_list_widget/news_list_item_widget.dart';
import '../widgets/app_bar_widget/common_app_bar_widget.dart';
import '../widgets/common_text_widget/highlight_text_widget.dart';
import '../widgets/shimmer_widget/shimmer_widget.dart';

class NewsCountryListScreen extends StatefulWidget {
  final CountryNewsNavigationParameters navigationParameters;
  const NewsCountryListScreen({
    Key? key,
    required this.navigationParameters,
  }) : super(key: key);

  @override
  _NewsCountryListScreenState createState() => _NewsCountryListScreenState();
}

class _NewsCountryListScreenState extends State<NewsCountryListScreen> {
  String countryListApiError = "";
  TopHeadlineNewsModel? countryListModel;
  ApiStatus countryListStatus = ApiStatus.none;

  @override
  void initState() {

    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ArticleListProvider>().getCountryArticle(widget.navigationParameters.countryCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        label: widget.navigationParameters.category,
        showNotification: true,
        backPress: () {
          Navigator.pop(context);
        },
        notificationPress: () {},
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HighLightTextWidget(),
            Consumer<ArticleListProvider>(builder: (context, provider, _) {
              if (provider.articleInitStatus == ApiStatus.loading) {
                return Column(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 10),
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
                    itemCount: provider.articleInitStatus == ApiStatus.success ? provider.countryArticleList.length : 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return provider.articleInitStatus == ApiStatus.success
                          ? NewsListItemWidget(
                              title: provider.countryArticleList[index].title,
                              imageUrl: provider.countryArticleList[index].urlToImage,
                              publishedAt: provider.countryArticleList[index].publishedAt!,
                              subTitle: provider.countryArticleList[index].content,
                              index: index,
                              author: provider.countryArticleList[index].source.name,
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
      ),
    );
  }

}
