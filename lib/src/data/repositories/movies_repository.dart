import 'package:flutter_project/src/core/utils/bloc_utils.dart';

import '../../core/api_constants.dart';
import '../../core/utils/state.dart';
import '../../data/mappers/to_movie_mapper.dart';
import '../../domain/repositories/i_repository.dart';
import '../../domain/entities/movie.dart';
import '../datasource/remote/i_api_service.dart';
import '../models/movie_page_model.dart';

class MoviesRepository implements MyRepository {
  MoviesRepository({required this.api});

  final ApiService api;

  String mappingCategoryIntoEndPoint(MovieCategory category){
    switch (category) {
      case MovieCategory.popular:
        return "movie/popular?";
      case MovieCategory.nowPlaying:
        return "movie/now_playing?";
      case MovieCategory.topRated:
         return "movie/top_rated?";
      default:
        return "";
    }
  }

  @override
  Future<DataState> getData(MovieCategory category) async {
    try {
      String url = mappingCategoryIntoEndPoint(category);
      final MoviePageModel response = await api.fetch(url);
      if (response.results.isEmpty) {
        return DataState(responseState: ResponseState.empty);
      } else {
        List<Movie> movieList = [];
        movieList = response.results.map((e) => ToMovie().call(e)).toList();
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
}
