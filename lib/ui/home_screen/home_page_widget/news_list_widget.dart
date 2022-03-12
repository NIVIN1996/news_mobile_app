import 'package:flutter/material.dart';
import 'package:news_mobile_app/utils/responsive_config/responsive_config.dart';

import '../../../utils/text_style/text_style.dart';
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
          Container(
            padding: EdgeInsets.symmetric(vertical: context.heightPx * 5.0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return NewsListItemWidget(
                    index: index,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
