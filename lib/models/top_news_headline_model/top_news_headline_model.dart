import 'dart:convert';

import 'article_model.dart';

TopHeadlineNewsModel topHeadlineNewsModelFromJson(String str) => TopHeadlineNewsModel.fromJson(json.decode(str));

class TopHeadlineNewsModel {
  TopHeadlineNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory TopHeadlineNewsModel.fromJson(Map<String, dynamic> json) => TopHeadlineNewsModel(
        status: json["status"],
        totalResults: json["totalResults"] ?? 0,
        articles: json["articles"] == null ? [] : List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
      );
}


class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: (json["id"] == null) ? "" : json["id"],
        name: json["name"] ?? "",
      );
}
