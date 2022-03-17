import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movie_app/models/reposetory_helper.dart';

import '../commons/common.dart';
import '../models/movies/get_movies_list.dart';

class MoviesRepository {
  static Future<ResponseHelper<List<Results>>> getMoviesList(
      {String url = '${Common.getMoviesListForAnonymous}',
      required int page}) async {
    ResponseHelper<List<Results>> _responseHelper = ResponseHelper(data: []);
    try {
      final response = await http.get(Uri.parse("$url&page=$page"));

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);

        GetMoviesList moviesList = GetMoviesList.fromJson(responseData);
        if (_responseHelper.data.length < moviesList.totalResults &&
            moviesList.results.isNotEmpty) {
          _responseHelper.data = moviesList.results;
          _responseHelper.hasError = false;
          _responseHelper.isLoading = false;
          _responseHelper.total_pages = moviesList.totalPages;
        }

        return _responseHelper;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('${e.toString()}}');
      _responseHelper.errorMessage = 'try again';
    }
    _responseHelper.isLoading = false;
    _responseHelper.hasError = true;

    return _responseHelper;
  }
}
