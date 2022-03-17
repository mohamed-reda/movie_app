class ViewMyWatchList {
  ViewMyWatchList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Results> results;
  late final int totalPages;
  late final int totalResults;

  ViewMyWatchList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Results {
  Results({
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.video,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.voteCount,
    required this.adult,
    required this.backdropPath,
    required this.title,
    required this.popularity,
  });
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String posterPath;
  late final bool video;
  late final double voteAverage;
  late final String overview;
  late final String releaseDate;
  late final int voteCount;
  late final bool adult;
  late final String backdropPath;
  late final String title;
  late final double popularity;

  Results.fromJson(Map<String, dynamic> json) {
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    title = json['title'];
    popularity = json['popularity'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['poster_path'] = posterPath;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['overview'] = overview;
    _data['release_date'] = releaseDate;
    _data['vote_count'] = voteCount;
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['title'] = title;
    _data['popularity'] = popularity;
    return _data;
  }
}
//https://api.themoviedb.org/3/account/12087808/watchlist/movies?api_key=31521ab741626851b73c684539c33b5a&session_id=b3a95741fac256ff4ff02b28b1062c7d7555511e
