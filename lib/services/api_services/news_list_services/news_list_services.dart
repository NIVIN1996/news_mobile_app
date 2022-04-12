import 'package:flutter/cupertino.dart';
import 'package:news_mobile_app/services/api/api_manager.dart';
import 'package:news_mobile_app/services/end_points/end_points.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';

class NewsListingService {
  static const apiKey = 'apiKey=a1ca159c437a41abb943af25efefa5ed';
  static Future<TopHeadlineNewsModel> getTopNewsHeadlines() async {
    return await ApiManager(url: NewsAppUrls.topNewsHeadlines).get((p0) {
      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

  static Future<TopHeadlineNewsModel> getCategoryNews(BuildContext context,String category,int page,int limit) async {
    return await ApiManager(url: NewsAppUrls.newsHeadlines+"category=$category&"+apiKey+"&page=$page"+"&limit=$limit").get((p0) {
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
