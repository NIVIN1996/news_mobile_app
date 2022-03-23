import 'package:flutter/material.dart';
import 'package:news_mobile_app/models/top_news_headline_model/article_model.dart';
import 'package:news_mobile_app/models/top_news_headline_model/top_news_headline_model.dart';

import '../../services/api_services/news_list_services/news_list_services.dart';
import '../../utils/static/enums.dart';



class ArticleListProvider extends ChangeNotifier {
  TopHeadlineNewsModel? topHeadlineNewsModel;

  List<Article> articleList =[];
  List<Article> categoryArticleList =[];
  ApiStatus articleInitStatus = ApiStatus.none;
  ApiStatus articleLoaderStatus = ApiStatus.none;
  String apiErrors = "";

  Future<ApiStatus> getArticle() async {
    articleInitStatus = ApiStatus.loading;
    notifyListeners();
    topHeadlineNewsModel = await NewsListingService.getTopNewsHeadlines();
    if (topHeadlineNewsModel!.status == "ok") {
      articleInitStatus = ApiStatus.success;
      articleList =topHeadlineNewsModel!.articles;
    } else {
      articleInitStatus = ApiStatus.error;
      apiErrors = topHeadlineNewsModel!.status;
    }
    notifyListeners();
    return articleInitStatus;
  }
  Future<ApiStatus> getCategoryArticle(String category) async {
    articleInitStatus = ApiStatus.loading;
    notifyListeners();
    topHeadlineNewsModel = await NewsListingService.getCategoryNews(category);
    if (topHeadlineNewsModel!.status == "ok") {
      articleInitStatus = ApiStatus.success;
      categoryArticleList =topHeadlineNewsModel!.articles;
      print(categoryArticleList);
    } else {
      articleInitStatus = ApiStatus.error;
      apiErrors = topHeadlineNewsModel!.status;
    }
    notifyListeners();
    return articleInitStatus;
  }

  final List<Article> _myList = [];
  List<Article> get myList => _myList;

  void addBookmark(Article value) {
    _myList.add(value);
    print("item added");
    notifyListeners();
  }

  void removeFromList(Article value) {
    _myList.remove(value);
    print("item removed");
    notifyListeners();
  }
}
