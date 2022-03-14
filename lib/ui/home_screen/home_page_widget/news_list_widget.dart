import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:news_mobile_app/widgets/shimmer_widget/shimmer_widget.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../../utils/static/enums.dart';
import '../../../utils/text_style/text_style.dart';
import 'news_list_item_widget.dart';

class NewsListWidget extends StatefulWidget {
  final TopHeadlineNewsModel? model;
  final ApiStatus status;
  final Function retryCallBack;
  final bool isDelivered;
  final String apiError;
  const NewsListWidget({
    Key? key,
    this.model,
    required this.status,
    required this.retryCallBack,
    required this.isDelivered,
    required this.apiError,
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
          Container(
            padding: EdgeInsets.symmetric(vertical: context.heightPx * 5.0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: widget.status == ApiStatus.success ? widget.model!.articles.length : 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return  widget.status == ApiStatus.success
                      ?  NewsListItemWidget(
                    title: widget.model!.articles[index].title,
                    imageUrl: widget.model!.articles[index].urlToImage,
                    publishedAt: widget.model!.articles[index].publishedAt.toString(),
                    subTitle: widget.model!.articles[index].description,
                    index: index, author: widget.model!.articles[index].source.name,
                  ):Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.widthPx * 25.0, vertical: context.heightPx * 10),
                    child: ShimmerWidget(
                      height: context.heightPx*140,
                      width: context.widthPx*100,
                      radius: 10,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
