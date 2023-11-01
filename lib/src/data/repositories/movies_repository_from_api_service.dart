import 'package:flutter_project/src/data/datasource/local/movie_database.dart';

import '../../core/api_constants.dart';
import '../../core/utils/movie_category_enum.dart';
import '../../core/utils/state.dart';
import '../../data/mappers/to_movie_mapper.dart';
import '../../domain/repositories/i_repository_from_api.dart';
import '../../domain/entities/movie.dart';
import '../datasource/remote/i_api_service.dart';
import '../models/movie_page_model.dart';

class MoviesRepositoryFromApiService implements MyRepositoryFromApi {
  MoviesRepositoryFromApiService({
    required this.api,
    required this.movieDatabase,
  });

  final ApiService api;
  final MovieDatabase movieDatabase;

  @override
  Future<DataState> getData(MovieCategory category) async {
    try {
      final MoviePageModel response = await api.fetch(category.endpoint);
      if (response.results.isEmpty) {
        return DataState(responseState: ResponseState.empty);
      } else {
        List<Movie> movieList = [];
        movieList = response.results.map((e) => ToMovie().call(e)).toList();
        saveMovies(
          movieList,
          category,
        );
        return DataState(
          data: movieList,
          responseState: ResponseState.success,
        );
      }
    } catch (e) {
      return DataState(
        responseState: ResponseState.error,
        error: ApiConstants.errorMessage,
      );
    }
  }

  void saveMovies(List<Movie> movies, MovieCategory category) {
    for (Movie movie in movies) {
      if (!movie.categories.contains(category.name)) {
        movie.categories.add(category.name);
      }
      movieDatabase.saveMovie(movie: movie);
    }
  }
}
