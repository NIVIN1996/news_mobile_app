import 'package:flutter/material.dart';

import '../../models/category_model/category_model_navigation_params.dart';

import '../../widgets/app_bar_widget/common_app_bar_widget.dart';
import '../../widgets/popup_widget/popup_widget.dart';
import '../home_screen/home_page_widget/news_list_widget.dart';

class NewsCategoryListScreen extends StatefulWidget {
  final CategoryNewsNavigationParameters navigationParameters;
  const NewsCategoryListScreen({
    Key? key,
    required this.navigationParameters,
  }) : super(key: key);

  @override
  _NewsCategoryListScreenState createState() => _NewsCategoryListScreenState();
}

class _NewsCategoryListScreenState extends State<NewsCategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWidget(
        showFilter: true,
        label: widget.navigationParameters.category,
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
          children: [
            NewsListWidget(
              status: widget.navigationParameters.categoryNewsStatus,
              apiError: widget.navigationParameters.errorStatus,
              model: widget.navigationParameters.categoryListModel,
              isDelivered: true,
              retryCallBack: widget.navigationParameters.callBack,
            ),
          ],
        ),
      ),
    );
  }
}
