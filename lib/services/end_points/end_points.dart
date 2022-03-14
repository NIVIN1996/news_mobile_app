class NewsAppUrls {
  static const baseUrl = 'https://newsapi.org/v2/';
  static const apiKey ='apiKey=1273ef6fa8e64ea19ea60df0ebca1353';

  static const topNewsHeadlines = baseUrl + 'top-headlines?country=in&'+apiKey;
  static const businessNewsHeadlines =
      baseUrl + 'top-headlines?country=in&category=business&'+apiKey;
  static const sportsNewsHeadlines =
      baseUrl + 'top-headlines?country=in&category=sports&'+apiKey;
  static const entertainmentNewsHeadlines =
      baseUrl + 'top-headlines?country=in&category=entertainment&'+apiKey;
  static const politicsNewsHeadlines =
      baseUrl + 'top-headlines?country=in&category=politics&'+apiKey;
}
