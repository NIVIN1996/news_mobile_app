import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';

import '../../models/category_model/category_model_navigation_params.dart';

import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/static/enums.dart';
import '../../utils/text_style/text_style.dart';
import '../home_screen/home_page_widget/news_list_widget/news_list_item_widget.dart';

import '../widgets/app_bar_widget/common_app_bar_widget.dart';
import '../widgets/shimmer_widget/shimmer_widget.dart';

class NewsCategoryListScreen extends StatefulWidget {
  final CategoryNewsNavigationParameters navigationParameters;
  const NewsCategoryListScreen({
    Key? key,
    required this.navigationParameters,
  }) : super(key: key);

  @override
  _NewsCategoryListScreenState createState() => _NewsCategoryListScreenState();
}

class _NewsCategoryListScreenState extends State<NewsCategoryListScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<ArticleListProvider>().getCategoryArticle(widget.navigationParameters.category);
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 10),
              child: Text(
                "Highlights",
                textAlign: TextAlign.start,
                style: TextFontStyle.semiBold(size: context.textPx * 20),
              ),
            ),
            Consumer<ArticleListProvider>(builder: (context, provider, _) {
              if (provider.articleInitStatus == ApiStatus.loading) {
                return Column(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 5),
                        child: ShimmerWidget(
                          height: context.heightPx * 140,
                          width: double.infinity,
                          radius: 10,
                        ),
                      )
                  ],
                );
              }
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount:
                      provider.articleInitStatus == ApiStatus.success ? provider.categoryArticleList.length : 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return provider.articleInitStatus == ApiStatus.success
                        ? NewsListItemWidget(
                            title: provider.categoryArticleList[index].title,
                            imageUrl: provider.categoryArticleList[index].urlToImage,
                            publishedAt: provider.categoryArticleList[index].publishedAt!,
                            subTitle: provider.categoryArticleList[index].content,
                            index: index,
                            author: provider.categoryArticleList[index].source.name,
                            pageType: 'CategoryNews',
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.widthPx * 25.0, vertical: context.heightPx * 5),
                            child: ShimmerWidget(
                              height: context.heightPx * 140,
                              width: context.widthPx * 100,
                              radius: 10,
                            ),
                          );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
