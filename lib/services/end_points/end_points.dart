class NewsAppUrls {
  static const baseUrl = 'https://newsapi.org/v2/';
  static const apiKey = 'apiKey=a1ca159c437a41abb943af25efefa5ed';

  static const topNewsHeadlines = baseUrl + 'top-headlines?country=in&' + apiKey;
  static const businessNewsHeadlines = baseUrl + 'top-headlines?country=in&category=business&' + apiKey;
  static const newsHeadlines = baseUrl + 'top-headlines?country=in&';
  static const sportsNewsHeadlines = baseUrl + 'top-headlines?country=in&category=sports&' + apiKey;
  static const entertainmentNewsHeadlines = baseUrl + 'top-headlines?country=in&category=Entertainment&' + apiKey;
  static const politicsNewsHeadlines = baseUrl + 'top-headlines?country=in&category=politics&' + apiKey;
  static const indiaNewsHeadlines = baseUrl + 'top-headlines?';
  static const searchNewsHeadlines = baseUrl + 'everything?';
}
