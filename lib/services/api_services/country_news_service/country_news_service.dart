import 'package:news_mobile_app/services/api/api_manager.dart';
import 'package:news_mobile_app/services/end_points/end_points.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';

class CountryNewsService {
  static const apiKey = 'apiKey=cbc27393fe50431cb058f81ab4a5931f';
  static Future<TopHeadlineNewsModel> getIndiaNewsHeadlines(String countryCode) async {
    return await ApiManager(url: NewsAppUrls.indiaNewsHeadlines+"country=$countryCode&"+apiKey).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

}
