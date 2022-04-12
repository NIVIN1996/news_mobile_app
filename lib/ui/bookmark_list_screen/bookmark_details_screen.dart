import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/news_details_model/news_details_navigation_params.dart';

import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';
import '../widgets/app_bar_widget/common_app_bar_widget.dart';
import '../widgets/loader/loader_widget.dart';


class BookmarkNewsDetailsScreen extends StatefulWidget {
  final NewsDetailsNavigationParameters navigationParameters;
  const BookmarkNewsDetailsScreen({
    Key? key,
    required this.navigationParameters,
  }) : super(key: key);

  @override
  _BookmarkNewsDetailsScreenState createState() => _BookmarkNewsDetailsScreenState();
}

class _BookmarkNewsDetailsScreenState extends State<BookmarkNewsDetailsScreen> {
  bool selectBookmark = false;

  @override
  Widget build(BuildContext context) {
    final article = context.watch<ArticleListProvider>().bookmarkArticleList;
    final articleDb = context.watch<ArticleListProvider>().articleBox;
    return Scaffold(
      appBar: CommonAppBarWidget(
        label: "News4U",
        showNotification: false,
        backPress: () {
          Navigator.pop(context);
        },
        notificationPress: () {},
        appBar: AppBar(),
      ),
      body: articleDb != null
          ? SingleChildScrollView(
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
                          fit: BoxFit.scaleDown,
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
                                onTap: () async{
                                  final url = widget.navigationParameters.newsUrl;
                                  print(url);
                                  await Share.share("News link:- $url",subject: url);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: context.widthPx * 10.0),
                                  child: Icon(Icons.share, color: AppColor.grey5, size: context.widthPx * 30),
                                )),
                            IconButton(
                              icon: Icon(Icons.bookmark, color: AppColor.yellow2, size: context.widthPx * 30),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    backgroundColor: AppColor.whiteColor,
                                    title: Text(
                                      "Do You Want to remove the Bookmark?",
                                      style: TextFontStyle.regular(color: AppColor.black, size: context.textPx * 20),
                                    ),
                                    actions: [
                                      TextButton(
                                          child: Text(
                                            "Ok",
                                            style:
                                                TextFontStyle.regular(color: AppColor.black, size: context.textPx * 16),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<ArticleListProvider>()
                                                .removeFromList(article[widget.navigationParameters.index]);
                                            // context.pushNamedAndRemoveUntil(ScreenNames.bookmarkListScreen);
                                            Timer(const Duration(seconds: 0), () {
                                              Navigator.pop(context); // Dismisses dialog
                                              Navigator.pop(context); // Navigates back to previous screen
                                            });
                                            // Navigator.pop(context);
                                            // Navigator.pop(context);
                                          }),
                                      TextButton(
                                          child: Text(
                                            "Cancel",
                                            style:
                                                TextFontStyle.regular(color: AppColor.black, size: context.textPx * 16),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }),
                                    ],
                                  ),
                                );
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
            )
          : const Center(
              child: LoaderWidget(),
            ),
    );
  }
}
