import 'dart:convert';

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

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: (json["author"] == null) ? "" : json["author"],
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: (json["content"] == null) ? "" : json["content"],
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
