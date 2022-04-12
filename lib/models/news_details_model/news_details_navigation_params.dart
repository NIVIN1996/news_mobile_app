class NewsDetailsNavigationParameters {
  int index;
  String imageUrl;
  String title;
  String author;
  String subTitle;
  String publishedAt;
  String pageType;
  String newsUrl;
  NewsDetailsNavigationParameters(
      {required this.subTitle,
      required this.index,
      required this.pageType,
      required this.title,
        required this.newsUrl,
      required this.publishedAt,
      required this.imageUrl,
      required this.author});
}
