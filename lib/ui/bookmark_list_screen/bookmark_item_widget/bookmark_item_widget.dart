import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_mobile_app/ui/navigation/navigation.dart';
import 'package:news_mobile_app/ui/widgets/shimmer_widget/shimmer_widget.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import '../../../../utils/color/colors.dart';
import '../../../../utils/text_style/text_style.dart';
import '../../../models/news_details_model/news_details_navigation_params.dart';
import '../../../models/top_news_headline_model/article_model.dart';
import '../../../providers/news_list_provider/news_list_provider.dart';
import '../../navigation/routes.dart';

class BookmarkItemWidget extends StatefulWidget {
  final int index;
  final Article currentArticle;
  final String imageUrl;
  final String title;
  final String subTitle;
  final String author;
  final String content;
  final String url;
  final DateTime publishedAt;

  const BookmarkItemWidget({
    Key? key,
    required this.index,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.author,
    required this.content,
    required this.url,
    required this.currentArticle, required this.publishedAt,
  }) : super(key: key);

  @override
  _BookmarkItemWidgetState createState() => _BookmarkItemWidgetState();
}

class _BookmarkItemWidgetState extends State<BookmarkItemWidget> {
  bool selectBookmark = false;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    String date = dateFormat.format(widget.publishedAt);
    String formattedTime = DateFormat('kk:mm a').format(widget.publishedAt);
    final _myList = context
        .watch<ArticleListProvider>()
        .myList;
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          ScreenNames.newsDetailsScreen,
          arguments: NewsDetailsNavigationParameters(
              author: widget.author,
              imageUrl: widget.imageUrl,
              publishedAt: date + " " + formattedTime,
              subTitle: widget.subTitle,
              title: widget.title, index: widget.index),
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: context.heightPx * 5, horizontal: context.widthPx * 25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(context.widthPx * 10.0),
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
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.widthPx * 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: context.heightPx * 10.0, bottom: context.heightPx * 3.0),
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
                          GestureDetector(
                              onTap: () {
                                final data = _myList[widget.index];
                                context.read<ArticleListProvider>().removeFromList(data);

                              },
                              child: Icon(Icons.close, color: AppColor.red, size: context.widthPx * 20)),
                        ],
                      ),
                    ),
                    widget.content.isEmpty
                        ? const SizedBox(
                            height: 80,
                          )
                        : Text(
                            widget.content,
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
    );
  }
}
