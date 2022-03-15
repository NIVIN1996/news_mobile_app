import 'package:news_mobile_app/services/api/api_manager.dart';
import 'package:news_mobile_app/services/end_points/end_points.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';

class NewsListingService {
  static Future<TopHeadlineNewsModel> getTopNewsHeadlines() async {
    return await ApiManager(url: NewsAppUrls.topNewsHeadlines).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

  static Future<TopHeadlineNewsModel> getBusinessNews() async {
    return await ApiManager(url: NewsAppUrls.businessNewsHeadlines).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

  static Future<TopHeadlineNewsModel> getPolitics() async {
    return await ApiManager(url: NewsAppUrls.politicsNewsHeadlines).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

  static Future<TopHeadlineNewsModel> getSports() async {
    return await ApiManager(url: NewsAppUrls.sportsNewsHeadlines).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

  static Future<TopHeadlineNewsModel> getEntertainment() async {
    return await ApiManager(url: NewsAppUrls.entertainmentNewsHeadlines).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }
}
