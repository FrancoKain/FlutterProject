import 'package:flutter_project/src/data/datasource/remote/movie_api_provider.dart';
import '../../domain/repositories/i_repository.dart';
import '../../domain/entities/movie.dart';

class MoviesRepository implements MyRepository {
  static const String moviesJsonPath = 'assets/mock_data/movies.json';

  late Future<List<Movie>> movies;

  @override
  Future<List<Movie>> getData() async {
   var response =  await MovieApiProvider().fetchMovieList();
    return response.results;
  }
}
