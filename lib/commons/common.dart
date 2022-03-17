class Common {
  static const apikey =
      '31521ab741626851b73c684539c33b5a&language=en-US&page=1';
  static const String baseURL = 'https://api.themoviedb.org/3';
  static const String apiKey = 'c5850ed73901b8d268d0898a8a9d8bff';
  static const String defaultConfiguration = 'language=en-US';
  //https://api.themoviedb.org/3/movie/now_playing?api_key=31521ab741626851b73c684539c33b5a&language=en-US&page=1
  static const String getMoviesListForAnonymous =
      '$baseURL/movie/now_playing?api_key=$apiKey&$defaultConfiguration';
  // https://api.themoviedb.org/3/movie/now_playing?api_key=<<api_key>>&language=en-US&page=1

  static const String getWatchlist =
      '$baseURL/account/12087808/watchlist/movies?api_key=$apiKey&$defaultConfiguration';
  static const String upcomingMoviesURL =
      '$baseURL/movie/upcoming?api_key=$apiKey&$defaultConfiguration';

  ///Auth and account URL
  static const String generateTokenURL =
      '$baseURL/authentication/token/new?api_key=$apiKey';

  // https://api.themoviedb.org/3/authentication/token/new?api_key=31521ab741626851b73c684539c33b5a
}
