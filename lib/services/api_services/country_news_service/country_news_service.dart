import 'package:news_mobile_app/services/api/api_manager.dart';
import 'package:news_mobile_app/services/end_points/end_points.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';

class CountryNewsService {
  static const apiKey = 'apiKey=2e6c65e5132041429e549af8c6bf8c56';
  static Future<TopHeadlineNewsModel> getIndiaNewsHeadlines(String countryCode) async {
    return await ApiManager(url: NewsAppUrls.indiaNewsHeadlines+"country=$countryCode&"+apiKey).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

}
