import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/color/colors.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';

import '../../models/category_model/category_model_navigation_params.dart';

import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/static/enums.dart';
import '../home_screen/home_page_widget/news_list_widget/news_list_item_widget.dart';

import '../widgets/app_bar_widget/common_app_bar_widget.dart';
import '../widgets/common_text_widget/highlight_text_widget.dart';
import '../widgets/loader/pagination_loader_widget.dart';
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
  final ScrollController _scrollController = ScrollController();

  bool onNotification(ScrollNotification notification) {
    ArticleListProvider dataProvider = Provider.of<ArticleListProvider>(context, listen: false);

    if (notification is ScrollUpdateNotification && notification.metrics.axisDirection == AxisDirection.down) {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent &&
          dataProvider.categoryNewsModel != null) {
        int lastPage = 4;
        int currentPage = dataProvider.currentPage;
        if (currentPage < lastPage) {
          dataProvider.setPageCount(currentPage += 1);
          dataProvider.initCategoryList(context, widget.navigationParameters.category);
        }
      }
    }
    return true;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context
          .read<ArticleListProvider>()
          .initCategoryList(context, widget.navigationParameters.category, initial: true);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _refresh() {
    return context.read<ArticleListProvider>().getCategoryArticle(context, widget.navigationParameters.category);
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
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: AppColor.yellow2,
        child: NotificationListener(
          onNotification: onNotification,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HighLightTextWidget(),
                Consumer<ArticleListProvider>(builder: (context, provider, _) {
                  if (provider.articleInitStatus == ApiStatus.loading) {
                    return  Column(
                      children: [
                        for (int i = 0; i < 6; i++)
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: context.widthPx * 25.0, vertical: context.heightPx * 5),
                            child: ShimmerWidget(
                              height: context.heightPx * 140,
                              width: double.infinity,
                              radius: 10,
                            ),
                          )
                      ],
                    );
                  }
                  return Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: provider.articleInitStatus == ApiStatus.success ? provider.categoryData.length : 5,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return provider.articleInitStatus == ApiStatus.success
                                ? NewsListItemWidget(
                                    title: provider.categoryData[index].title,
                                    imageUrl: provider.categoryData[index].urlToImage,
                                    publishedAt: provider.categoryData[index].publishedAt!,
                                    subTitle: provider.categoryData[index].content,
                                    index: index,
                                    author: provider.categoryData[index].source.name,
                                    pageType: 'CategoryNews', newsUrl: provider.categoryData[index].url,
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
                          }),
                      pageLoaderWidget(context, context.watch<ArticleListProvider>().isLoading),

                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
