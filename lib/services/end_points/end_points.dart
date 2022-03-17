class NewsAppUrls {
  static const baseUrl = 'https://newsapi.org/v2/';
  static const apiKey = 'apiKey=2e6c65e5132041429e549af8c6bf8c56';

  static const topNewsHeadlines = baseUrl + 'top-headlines?country=in&' + apiKey;
  static const businessNewsHeadlines = baseUrl + 'top-headlines?country=in&category=business&' + apiKey;
  static const sportsNewsHeadlines = baseUrl + 'top-headlines?country=in&category=sports&' + apiKey;
  static const entertainmentNewsHeadlines = baseUrl + 'top-headlines?country=in&category=entertainment&' + apiKey;
  static const politicsNewsHeadlines = baseUrl + 'top-headlines?country=in&category=politics&' + apiKey;
  static const usNewsHeadlines = baseUrl + 'top-headlines?country=us&' + apiKey;
  static const japanNewsHeadlines = baseUrl + 'top-headlines?country=jp&' + apiKey;
  static const indiaNewsHeadlines = baseUrl + 'top-headlines?country=in&' + apiKey;
  static const russiaNewsHeadlines = baseUrl + 'top-headlines?country=ru&' + apiKey;
  static const searchNewsHeadlines = baseUrl + 'everything?';
}
