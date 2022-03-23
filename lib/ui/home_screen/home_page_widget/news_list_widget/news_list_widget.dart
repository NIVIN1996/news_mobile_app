import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/widgets/shimmer_widget/shimmer_widget.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import '../../../../providers/news_list_provider/news_list_provider.dart';
import '../../../../utils/static/enums.dart';
import '../../../../utils/text_style/text_style.dart';
import 'news_list_item_widget.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  _NewsListWidgetState createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
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
                  itemCount: provider.articleInitStatus == ApiStatus.success
                      ? provider.topHeadlineNewsModel!.articles.length
                      : 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return provider.articleInitStatus == ApiStatus.success
                        ? NewsListItemWidget(
                            title: provider.topHeadlineNewsModel!.articles[index].title,
                            imageUrl: provider.topHeadlineNewsModel!.articles[index].urlToImage,
                            publishedAt: provider.topHeadlineNewsModel!.articles[index].publishedAt!,
                            subTitle: provider.topHeadlineNewsModel!.articles[index].content,
                            index: index,
                            author: provider.topHeadlineNewsModel!.articles[index].source.name,
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
    );
  }
}
