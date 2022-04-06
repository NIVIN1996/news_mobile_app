import 'package:hive/hive.dart';
import 'package:news_mobile_app/models/top_news_headline_model/source_model.dart';
part 'article_model.g.dart';

@HiveType(typeId: 1)
class Article {
  @HiveField(0)
  final Source source;
  @HiveField(1)
  final String author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String description;
  @HiveField(4)
  final String url;
  @HiveField(5)
  final String urlToImage;
  @HiveField(6)
  final DateTime? publishedAt;
  @HiveField(7)
  final String content;

  Article({
    required this.source,
     required this.author,
     required this.title,
     required this.description,
     required this.url,
     required this.urlToImage,
     this.publishedAt,
     required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source:json["source"] ==null? Source(id:"",name: ""): Source.fromJson(json["source"]),
        author: (json["author"] == null) ? "" : json["author"],
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: (json["content"] == null) ? "" : json["content"],
      );
}
