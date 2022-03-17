import 'package:bloc/bloc.dart';

import '../../models/movies/get_movies_list.dart';
import 'package:movie_app/models/reposetory_helper.dart';

import '../repository/movies_repository.dart';

class MoviesListCubit extends Cubit<MovieState> {
  int _page = 1;
  bool _isLoadMoreRunning = false;

  MoviesListCubit() : super(InitState());
  ResponseHelper<List<Results>> _responseHelper = ResponseHelper(
      hasError: true,
      errorMessage: 'An Error occurred',
      isLoading: false,
      data: []);

  ResponseHelper<List<Results>> get responseHelper => _responseHelper;

  Future<void> getDataEvent() async {
    _isLoadMoreRunning = true;
    emit(GettingDataState());

    _responseHelper = await MoviesRepository.getMoviesList(page: _page);
    if (_responseHelper.data.isNotEmpty && _responseHelper.data.length > 1) {
      _page = 2;
    }

    emit(WeHaveDataState());
    _isLoadMoreRunning = false;
  }

  Future<void> getAnother20() async {
    if (_page <= _responseHelper.total_pages && !_isLoadMoreRunning) {
      _isLoadMoreRunning = true;
      emit(GettingAnother20());
      ResponseHelper<List<Results>> value =
          await MoviesRepository.getMoviesList(page: _page);
      if (value.data.isNotEmpty) {
        _responseHelper.data += value.data;
      }
      _page += 1;
      emit(WeHaveDataState());
      _isLoadMoreRunning = false;
    }
  }
}

class MovieState {}

class InitState extends MovieState {}

class GettingDataState extends MovieState {}

class GettingAnother20 extends MovieState {}

class WeHaveDataState extends MovieState {}
