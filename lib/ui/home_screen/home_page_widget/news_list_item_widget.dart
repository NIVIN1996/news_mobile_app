import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_mobile_app/models/news_details_model/news_details_navigation_params.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/text_style/text_style.dart';
import '../../../widgets/shimmer_widget/shimmer_widget.dart';


class NewsListItemWidget extends StatefulWidget {
  final int index;
  final String imageUrl;
  final String title;
  final String author;
  final String subTitle;
  final DateTime publishedAt;

  const NewsListItemWidget({
    Key? key,
    required this.index,
    required this.imageUrl,
    required this.title,
    required this.subTitle,
    required this.publishedAt,
    required this.author,
  }) : super(key: key);

  @override
  _NewsListItemWidgetState createState() => _NewsListItemWidgetState();
}

class _NewsListItemWidgetState extends State<NewsListItemWidget> {
  bool selectBookmark = false;
  DateFormat dateFormat = DateFormat("dd-MM-yyyy");


  @override
  Widget build(BuildContext context) {
    String date = dateFormat.format(widget.publishedAt);
    String formattedTime = DateFormat('kk:mm a').format(widget.publishedAt);
    print(date);
    print(formattedTime);
    return GestureDetector(
      onTap: () {
        print(widget.index);
        context.pushNamed(
          ScreenNames.newsDetailsScreen,
          arguments: NewsDetailsNavigationParameters(
              author: widget.author,
              imageUrl: widget.imageUrl,
              publishedAt: date + " "+ formattedTime,
              subTitle: widget.subTitle,
              title: widget.title),
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
                          Text(
                            widget.author,
                            textAlign: TextAlign.start,
                            style: TextFontStyle.med(size: context.textPx * 16),
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectBookmark = !selectBookmark;
                                });
                              },
                              child: Icon(selectBookmark ? Icons.bookmark : Icons.bookmark_outline,
                                  color: AppColor.yellow2, size: context.widthPx * 18)),
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
                                text: date +" "+ formattedTime,
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
