import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import '../../models/news_details_model/news_details_navigation_params.dart';

import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';

class NewsDetailsScreen extends StatefulWidget {
  final NewsDetailsNavigationParameters navigationParameters;
  const NewsDetailsScreen({
    Key? key,
    required this.navigationParameters,
  }) : super(key: key);

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  bool selectBookmark = false;

  @override
  Widget build(BuildContext context) {
    var myList = context.watch<ArticleListProvider>().myList;
    var selectedArticle = context.watch<ArticleListProvider>().articleList;
    final article = selectedArticle[widget.navigationParameters.index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.navigationParameters.imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.widthPx * 20),
                  image: const DecorationImage(
                    image: AssetImage('assets/common/no_img.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              height: context.percentHeight * 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthPx * 20.0, vertical: context.heightPx * 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.only(right: context.widthPx * 5.0),
                            child: Icon(Icons.access_time, color: AppColor.grey5, size: context.widthPx * 18),
                          ),
                        ),
                        TextSpan(
                          text: "Posted on ${widget.navigationParameters.publishedAt}",
                          style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 14),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: context.widthPx * 10.0),
                            child: Icon(Icons.share, color: AppColor.grey5, size: context.widthPx * 30),
                          )),
                      IconButton(
                        icon: Icon(myList.contains(article) ? Icons.bookmark : Icons.bookmark_outline,
                            color: AppColor.yellow2, size: context.widthPx * 30),
                        onPressed: () {
                          final article = selectedArticle[widget.navigationParameters.index];

                          if (!myList.contains(article)) {
                            context.read<ArticleListProvider>().addBookmark(article);
                          } else {
                            context.read<ArticleListProvider>().removeFromList(article);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthPx * 20.0, vertical: context.heightPx * 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      widget.navigationParameters.title,
                      textAlign: TextAlign.start,
                      style: TextFontStyle.med(size: context.textPx * 25),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.widthPx * 20.0, vertical: context.heightPx * 10),
              child: Text(
                widget.navigationParameters.subTitle,
                textAlign: TextAlign.justify,
                style: TextFontStyle.regular(size: context.textPx * 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
