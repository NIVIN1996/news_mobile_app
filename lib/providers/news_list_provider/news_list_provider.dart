import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news_mobile_app/models/top_news_headline_model/article_model.dart';
import 'package:news_mobile_app/models/top_news_headline_model/top_news_headline_model.dart';
import '../../services/api_services/country_news_service/country_news_service.dart';
import '../../services/api_services/news_list_services/news_list_services.dart';
import '../../services/api_services/search_news_service/search_news_service.dart';
import '../../services/db/hive_helper.dart';
import '../../utils/static/enums.dart';
import '../../utils/static/static_string_keyword.dart';

class ArticleListProvider extends ChangeNotifier {
  TopHeadlineNewsModel? topHeadlineNewsModel;
  TopHeadlineNewsModel? categoryNewsModel;
  TopHeadlineNewsModel? searchNewsModel;
  TopHeadlineNewsModel? countryNewsModel;

  List<Article> articleList =[];
  List<Article> categoryArticleList =[];
  List<Article> searchArticleList =[];
  List<Article> countryArticleList =[];
  List<Article> bookmarkArticleList =[];

  ApiStatus articleInitStatus = ApiStatus.none;
  ApiStatus articleLoaderStatus = ApiStatus.none;

  String apiErrors = "";
  String title ="";

  Box? articleBox;

  //get all news articles
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

  //get all news articles based on category
  Future<ApiStatus> getCategoryArticle(String category) async {
    articleInitStatus = ApiStatus.loading;
    notifyListeners();
    categoryNewsModel = await NewsListingService.getCategoryNews(category);
    if (categoryNewsModel!.status == "ok") {
      articleInitStatus = ApiStatus.success;
      categoryArticleList =categoryNewsModel!.articles;
      // print("......categoryArticleList..............$categoryArticleList");
    } else {
      articleInitStatus = ApiStatus.error;
      apiErrors = categoryNewsModel!.status;
    }
    notifyListeners();
    return articleInitStatus;
  }

  // search news article
  Future<ApiStatus> getSearchArticle(String searchText) async {
    articleInitStatus = ApiStatus.loading;
    notifyListeners();
    searchNewsModel = await SearchNewsService.getSearchNews(searchText);
    if (searchNewsModel!.status == "ok") {
      articleInitStatus = ApiStatus.success;
      searchArticleList =searchNewsModel!.articles;
      // print("......searchList..............$searchArticleList");
    } else {
      articleInitStatus = ApiStatus.error;
      apiErrors = searchNewsModel!.status;
    }
    notifyListeners();
    return articleInitStatus;
  }

  //get news article based on country
  Future<ApiStatus> getCountryArticle(String countryCode) async {
    articleInitStatus = ApiStatus.loading;
    notifyListeners();
    countryNewsModel = await CountryNewsService.getCountryNewsHeadlines(countryCode);
    if (countryNewsModel!.status == "ok") {
      articleInitStatus = ApiStatus.success;
      countryArticleList =countryNewsModel!.articles;
      // print("......countryList..............$countryArticleList");
    } else {
      articleInitStatus = ApiStatus.error;
      apiErrors = countryNewsModel!.status;
    }
    notifyListeners();
    return articleInitStatus;
  }

  ///Local Db
  Future<void> _initHive() async {
    Box? box = await HiveHelper.openBox(StaticKeys.articleLocalDbLocation);
    if (box != null) {
      articleBox = box;
    }
  }

  final List<Article> _myList = [];
  List<Article> get myList => _myList;



  // void addBookmark(Article value) {
  //   _myList.add(value);
  //   print("item added");
  //   notifyListeners();
  // }

  // void getBookmarkListDb()async{
  //   await _initHive();
  //   bookmarkArticleList =HiveHelper.getAll(box: articleBox!).cast<Article>();
  //
  // }
  Future<ApiStatus> getBookmarkListDb() async {
    await _initHive();
    bookmarkArticleList = HiveHelper.getAll(box: articleBox!).cast<Article>();
    notifyListeners();
    return ApiStatus.success;
  }

  void addBookmark(Article value) async{
    // _myList.add(value);
    print("item added");
    await _initHive();
    await HiveHelper.addToDb(box: articleBox!, title: value.title, data: value);
    await getBookmarkListDb();
    notifyListeners();
  }

  void removeFromList(Article value) async{
    // _myList.remove(value);
    print("item removed");
    await _initHive();
    await HiveHelper.removeFromDb(title:value.title, box: articleBox!);
    await getBookmarkListDb();
    notifyListeners();
  }



}
