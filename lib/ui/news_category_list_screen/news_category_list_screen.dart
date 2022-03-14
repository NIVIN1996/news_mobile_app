import 'package:flutter/material.dart';

import '../../widgets/app_bar_widget/common_app_bar_widget.dart';
import '../../widgets/popup_widget/popup_widget.dart';
import '../home_screen/home_page_widget/news_list_widget.dart';

class NewsCategoryListScreen extends StatefulWidget {
  final String category;
  const NewsCategoryListScreen({Key? key, required this.category}) : super(key: key);

  @override
  _NewsCategoryListScreenState createState() => _NewsCategoryListScreenState();
}

class _NewsCategoryListScreenState extends State<NewsCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        showFilter: true,
        label: widget.category,
        showNotification: true,
        filterPress: () {
          showDialog(context: context, builder: (BuildContext context) => const PopUpWidget());
        },
        backPress: () {
          Navigator.pop(context);
        },
        notificationPress: () {},
        appBar: AppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            // NewsListWidget(),
          ],
        ),
      ),
    );
  }
}
