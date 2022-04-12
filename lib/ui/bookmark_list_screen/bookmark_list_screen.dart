import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';
import 'package:news_mobile_app/utils/text_style/text_style.dart';
import 'package:provider/provider.dart';
import '../../providers/news_list_provider/news_list_provider.dart';
import '../../utils/color/colors.dart';
import '../widgets/app_bar_widget/common_app_bar_widget.dart';
import 'bookmark_item_widget/bookmark_item_widget.dart';

class BookmarkListScreen extends StatefulWidget {
  final User? currentUser;
  const BookmarkListScreen({Key? key, this.currentUser}) : super(key: key);

  @override
  _BookmarkListScreenState createState() => _BookmarkListScreenState();
}

class _BookmarkListScreenState extends State<BookmarkListScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<ArticleListProvider>().getBookmarkListDb();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _bookmarkList = context.watch<ArticleListProvider>().bookmarkArticleList;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);

        return false;
      },
      child: Scaffold(
        appBar: CommonAppBarWidget(
          label: "Bookmark",
          showNotification: true,
          backPress: () {
            // widget.currentUser == null
            //     ? context.pushNamedAndRemoveUntil(ScreenNames.homeScreen)
            //     :
            //     context.pushNamedAndRemoveUntil(ScreenNames.homeScreen);
            Navigator.pop(context);
          },
          notificationPress: () {},
          appBar: AppBar(),
        ),
        body: _bookmarkList.isNotEmpty
            ? SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: context.heightPx * 5.0),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: _bookmarkList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        // final data = _myList[index];
                        // print(data);
                        // print("................");
                        // print(_bookmarkList.length);
                        // print(_bookmarkList[index].title);
                        final bookmarkData = _bookmarkList[index];

                        return BookmarkItemWidget(
                          title: bookmarkData.title,
                          imageUrl: bookmarkData.urlToImage,
                          subTitle: bookmarkData.content,
                          index: index,
                          url: bookmarkData.url,
                          content: bookmarkData.description,
                          author: bookmarkData.source.name,
                          currentArticle: bookmarkData,
                          publishedAt: bookmarkData.publishedAt!,
                          newsUrl: bookmarkData.url,
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
      ),
    );
  }
}
