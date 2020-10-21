class Constants {
  static const String TOP_NEWS_BASE_URL = "https://newsapi.org/v2";
  static const String TOP_HEADLINES_URL =
      "/top-headlines?country=za&apiKey=2976d8c3f0354911bc1309f9472111f9";
  //confihure dynamic url later
  // static const String APIKEY = "apiKey=2976d8c3f0354911bc1309f9472111f9";
  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=2976d8c3f0354911bc1309f9472111f9';
  }
}
