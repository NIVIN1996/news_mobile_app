class NewsDetailsNavigationParameters {
  int index;
  String imageUrl;
  String title;
  String author;
  String subTitle;
  String publishedAt;
  String pageType;
  NewsDetailsNavigationParameters(
      {required this.subTitle,
      required this.index,
      required this.pageType,
      required this.title,
      required this.publishedAt,
      required this.imageUrl,
      required this.author});
}
