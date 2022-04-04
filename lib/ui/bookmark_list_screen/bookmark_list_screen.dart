import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:news_mobile_app/utils/text_style/text_style.dart';
import 'package:provider/provider.dart';
import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/color/colors.dart';
import '../widgets/app_bar_widget/common_app_bar_widget.dart';
import 'bookmark_item_widget/bookmark_item_widget.dart';

class BookmarkListScreen extends StatefulWidget {
  const BookmarkListScreen({Key? key}) : super(key: key);

  @override
  _BookmarkListScreenState createState() => _BookmarkListScreenState();
}

class _BookmarkListScreenState extends State<BookmarkListScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<ArticleListProvider>().myList;

    return Scaffold(
      appBar: CommonAppBarWidget(
        label: "Bookmark",
        showNotification: true,
        backPress: () {
          Navigator.pop(context);
        },
        notificationPress: () {},
        appBar: AppBar(),
      ),
      body: _myList.isNotEmpty
          ? SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: context.heightPx * 5.0),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _myList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = _myList[index];
                      print(data);

                      return BookmarkItemWidget(
                        title: data.title,
                        imageUrl: data.urlToImage,
                        subTitle: data.content,
                        index: index,
                        url: data.url,
                        content: data.description,
                        author: data.source.name,
                        currentArticle: data,
                        publishedAt: data.publishedAt!,
                      );
                    }),
              ))
          : Center(
              child: Text(
                "No Bookmark Available",
                textAlign: TextAlign.center,
                style: TextFontStyle.med(size: context.textPx * 20, color: AppColor.red),
              ),
            ),
    );
  }
}
