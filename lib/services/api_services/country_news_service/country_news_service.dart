import 'package:flutter/cupertino.dart';
import 'package:news_mobile_app/services/api/api_manager.dart';
import 'package:news_mobile_app/services/end_points/end_points.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';

class CountryNewsService {
  static const apiKey = 'apiKey=a1ca159c437a41abb943af25efefa5ed';
  static Future<TopHeadlineNewsModel> getCountryNewsHeadlines(BuildContext context,String countryCode,int page,int limit) async {
    return await ApiManager(url: NewsAppUrls.indiaNewsHeadlines+"country=$countryCode&"+apiKey+"&page=$page"+"&limit=$limit").get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

}
