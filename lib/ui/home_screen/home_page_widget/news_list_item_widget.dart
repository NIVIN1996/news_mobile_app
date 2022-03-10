import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/services/navigator/routes.dart';
import 'package:news_mobile_app/utils/navigation/navigation.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/color/colors.dart';
import '../../../utils/text_style/text_style.dart';

class NewsListItemWidget extends StatefulWidget {
  final int index;

  const NewsListItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  _NewsListItemWidgetState createState() => _NewsListItemWidgetState();
}

class _NewsListItemWidgetState extends State<NewsListItemWidget> {
  bool selectBookmark = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(ScreenNames.newsDetailsScreen);
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
                    imageUrl: "https://picsum.photos/200/300",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(context.widthPx * 10),
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
                          image: AssetImage('assets/common/no_img.jpg'),
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
                            "Sports",
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
                      "Bairstow hundred leads England recovery against West Indies on Day 1",
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
                                text: "12/03/2022",
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
