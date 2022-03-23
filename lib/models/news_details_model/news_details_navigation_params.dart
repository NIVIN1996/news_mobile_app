class NewsDetailsNavigationParameters {
  int index;
  String imageUrl;
  String title;
  String author;
  String subTitle;
  String publishedAt;
  NewsDetailsNavigationParameters(
      {required this.subTitle,
      required this.index,
      required this.title,
      required this.publishedAt,
      required this.imageUrl,
      required this.author});
}
