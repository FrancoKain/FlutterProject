import 'package:flutter_project/src/core/utils/state.dart';
import 'package:flutter_project/src/data/mappers/to_movie_mapper.dart';
import '../../domain/repositories/i_repository.dart';
import '../../domain/entities/movie.dart';
import '../datasource/remote/movies_api_provider.dart';
import '../models/movie_response.dart';

class MoviesRepository implements MyRepository {
  static const String moviesJsonPath = 'assets/mock_data/movies.json';
  static const String popularMoviesUrl = "movie/popular?";
  static const String topRatedMoviesUrl = "movie/top_rated?";
  static const String nowPlayingMoviesUrl = "movie/now_playing?";


  late Future<List<Movie>> movies;

  @override
  Future<DataState> getPopularMovies() async {
    try {
      final MoviePageModel response =
      await ApiMovieService.fetchMovieList(popularMoviesUrl);
      if (response.results.isEmpty) {
        return DataState(state: ResponseState.empty);
      } else {
        List<Movie> movieList = [];
        response.results.map((e) => movieList.add(ToMovie().call(e)));
        return DataState(data: movieList, state: ResponseState.success);
      }
    } catch (e) {
      return DataState(state: ResponseState.error, error: 'something went wrong :(');
    }
  }

  Future<DataState> getTopRatedMovies() async {
    try {
      final MoviePageModel response =
      await ApiMovieService.fetchMovieList(topRatedMoviesUrl);
      if (response.results.isEmpty) {
        return DataState(state: ResponseState.empty);
      } else {
        List<Movie> movieList = [];
        response.results.map((e) => movieList.add(ToMovie().call(e)));
        return DataState(data: movieList, state: ResponseState.success);
      }
    } catch (e) {
      return DataState(state: ResponseState.error, error: 'something went wrong :(');
    }
  }

  Future<DataState> getNowPlayingMovies() async {
    try {
      final MoviePageModel response =
      await ApiMovieService.fetchMovieList(nowPlayingMoviesUrl);
      if (response.results.isEmpty) {
        return DataState(state: ResponseState.empty);
      } else {
        List<Movie> movieList = [];
        response.results.map((e) => movieList.add(ToMovie().call(e)));
        return DataState(data: movieList, state: ResponseState.success);
      }
    } catch (e) {
      return DataState(state: ResponseState.error, error: 'something went wrong :(');
    }
  }
}


