import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:news_mobile_app/models/top_news_headline_model/article_model.dart';


ValueNotifier<List<Article>> bookmarkListNotifier = ValueNotifier([]);

Future<void> addBookMarkDb(Article value) async{
  final articleDB =await Hive.openBox<Article>('article_db');
  await articleDB.add(value);
  bookmarkListNotifier.value.add(value);
  bookmarkListNotifier.notifyListeners();
}

Future<void> getAllArticle() async{
  final articleDB =await Hive.openBox<Article>('article_db');
  bookmarkListNotifier.value.clear();
  bookmarkListNotifier.value.addAll(articleDB.values);
  bookmarkListNotifier.notifyListeners();
}