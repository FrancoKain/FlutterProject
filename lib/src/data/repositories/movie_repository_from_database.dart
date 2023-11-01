import 'package:flutter_project/src/data/datasource/local/movie_database.dart';
import 'package:flutter_project/src/domain/repositories/i_my_repository_from_database.dart';

import '../../core/utils/movie_category_enum.dart';
import '../../core/utils/state.dart';
import '../../domain/entities/movie.dart';
import '../datasource/remote/i_api_service.dart';

class MoviesRepositoryFromDataBase implements MyRepositoryFromDatabase {
  MoviesRepositoryFromDataBase({required this.api, required this.movieDatabase});

  final ApiService api;
  final MovieDatabase movieDatabase;
  @override
  Future<DataState> getData(MovieCategory category) async {
    List<Movie> movies =  await movieDatabase.getMovies(category.name);
    if(movies.isNotEmpty){
      return DataState(responseState: ResponseState.success, data: movies);
    }
    else{
      return DataState(responseState: ResponseState.empty);
    }
  }
}
