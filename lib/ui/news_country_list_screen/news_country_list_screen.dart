import 'package:flutter/material.dart';
import 'package:news_mobile_app/ui/widgets/popup_widget/popup_widget.dart';
import '../../models/country_based_news_model.dart';
import '../../models/top_news_headline_model/top_news_headline_model.dart';
import '../../services/api_services/country_news_service/country_news_service.dart';
import '../../utils/static/enums.dart';

import '../home_screen/home_page_widget/news_list_widget/news_list_widget.dart';
import '../widgets/app_bar_widget/common_app_bar_widget.dart';

class NewsCountryListScreen extends StatefulWidget {
  final CountryNewsNavigationParameters navigationParameters;
  const NewsCountryListScreen({
    Key? key,
    required this.navigationParameters,
  }) : super(key: key);

  @override
  _NewsCountryListScreenState createState() => _NewsCountryListScreenState();
}

class _NewsCountryListScreenState extends State<NewsCountryListScreen> {
  String countryListApiError = "";
  TopHeadlineNewsModel? countryListModel;
  ApiStatus countryListStatus = ApiStatus.none;

  @override
  void initState() {

    _getCountryNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CommonAppBarWidget(

        label: widget.navigationParameters.category,
        showNotification: true,

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
              status: countryListStatus,
              apiError: countryListApiError,
              model: countryListModel,
              isDelivered: true,
              retryCallBack: _getCountryNews,
            ),
          ],
        ),
      ),
    );
  }
  _getCountryNews() async {
    setState(() {
      countryListApiError = "";
      countryListStatus = ApiStatus.loading;
    });
    countryListModel = await CountryNewsService.getIndiaNewsHeadlines(widget.navigationParameters.countryCode);
    setState(() {
      if (countryListModel!.status == "ok") {
        countryListStatus = ApiStatus.success;
      } else {
        countryListApiError = countryListModel!.status;
        countryListStatus = ApiStatus.error;
      }
    });
  }
}
