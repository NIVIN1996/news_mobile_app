
import 'package:news_mobile_app/services/api/api_manager.dart';
import 'package:news_mobile_app/services/end_points/end_points.dart';

import '../../../models/top_news_headline_model/top_news_headline_model.dart';

class SearchNewsService {
  static const apiKey = 'apiKey=a1ca159c437a41abb943af25efefa5ed';
  static Future<TopHeadlineNewsModel> getSearchNews(String searchText) async {

    return await ApiManager(url: NewsAppUrls.searchNewsHeadlines+"q=$searchText&"+apiKey).get((p0) {

      return TopHeadlineNewsModel.fromJson(p0);
    });
  }

}
