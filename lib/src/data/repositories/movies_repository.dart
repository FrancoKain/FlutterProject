import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/repositories/i_repository.dart';
import '../../domain/models/movie.dart';

class MoviesRepository implements MyRepository {
  static const String moviesJsonPath = 'assets/mock_data/movies.json';

  List<Movie> movies = [];

  @override
  Future<List<Movie>> getData() async {
    String movieData = await rootBundle.loadString(
      moviesJsonPath,
    );
    List<dynamic> movieMap = jsonDecode(movieData);
    for (var movie in movieMap) {
      movies.add(
        Movie.fromJson(
          json: movie,
        ),
      );
    }
    return movies;
  }
}
