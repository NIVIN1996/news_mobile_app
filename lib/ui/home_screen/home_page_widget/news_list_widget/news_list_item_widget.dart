import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:news_mobile_app/models/news_details_model/news_details_navigation_params.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/ui/widgets/shimmer_widget/shimmer_widget.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import '../../../../providers/news_list_provider/news_list_provider.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/text_style/text_style.dart';
import '../../../widgets/snackbar_widget/snackbar_widget.dart';

class NewsListItemWidget extends StatefulWidget {
  final int index;
  final String imageUrl;
  final String title;
  final String author;
  final String subTitle;
  final String pageType;
  final DateTime publishedAt;

  const NewsListItemWidget({
    Key? key,
    required this.index,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.publishedAt,
    required this.author,
    required this.pageType,
  }) : super(key: key);

  @override
  _NewsListItemWidgetState createState() => _NewsListItemWidgetState();
}

class _NewsListItemWidgetState extends State<NewsListItemWidget> {
  bool selectBookmark = false;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<ArticleListProvider>().getBookmarkListDb();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    String date = dateFormat.format(widget.publishedAt);
    String formattedTime = DateFormat('kk:mm a').format(widget.publishedAt);
    // var myList = context.watch<ArticleListProvider>().myList;
    var bookmarkItem = context.watch<ArticleListProvider>().bookmarkArticleList;
    var selectedArticle = widget.pageType == "HomeNews"
        ? context.watch<ArticleListProvider>().articleList
        : widget.pageType == "SearchNews"
            ? context.watch<ArticleListProvider>().searchArticleList
            : widget.pageType == "CategoryNews"
                ? context.watch<ArticleListProvider>().categoryArticleList
                : widget.pageType == "CountryNews"
                    ? context.watch<ArticleListProvider>().countryArticleList
                    : null;

    final article = selectedArticle![widget.index];
    final articleDb = context.watch<ArticleListProvider>().articleBox;


    return articleDb !=null? GestureDetector(
      onTap: () {
        context.pushNamed(
          ScreenNames.newsDetailsScreen,
          arguments: NewsDetailsNavigationParameters(
              index: widget.index,
              author: widget.author,
              imageUrl: widget.imageUrl,
              publishedAt: date + " " + formattedTime,
              subTitle: widget.subTitle,
              title: widget.title,
              pageType: widget.pageType),
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: context.heightPx * 5, horizontal: context.widthPx * 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    top: context.widthPx * 15.0, left: context.widthPx * 10.0, right: context.widthPx * 5.0),
                child: CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.widthPx * 10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const ShimmerWidget(
                    radius: 10,
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
                  height: context.heightPx * 100,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.widthPx * 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: context.heightPx * 0.0, bottom: context.heightPx * 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              widget.author,
                              textAlign: TextAlign.start,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextFontStyle.med(size: context.textPx * 16),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0),
                            icon: Icon(
                              articleDb.containsKey(article.title) ? Icons.bookmark : Icons.bookmark_outline,
                                color: AppColor.yellow2, size: context.widthPx * 20),
                            onPressed: () {

                              if (!articleDb.containsKey(article.title)) {
                                context.read<ArticleListProvider>().addBookmark(article);
                                AppSnackBar.showSnackBarWithText(context: context, text: "Added To Bookmark");
                              } else {
                                context.read<ArticleListProvider>().removeFromList(article);
                                AppSnackBar.showSnackBarWithText(context: context, text: "Removed From Bookmark");
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextFontStyle.regular(size: context.textPx * 14),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: context.heightPx * 8.0,
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(right: context.widthPx * 5.0),
                                  child: Icon(Icons.access_time, size: context.widthPx * 18),
                                ),
                              ),
                              TextSpan(
                                text: date + " " + formattedTime,
                                style: TextFontStyle.med(color: AppColor.grey5, size: context.textPx * 14),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ):
    Column(
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
}
