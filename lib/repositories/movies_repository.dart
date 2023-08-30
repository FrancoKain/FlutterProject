import 'dart:convert';
import 'package:flutter/services.dart';

import '../interfaces/i_repository.dart';
import '../models/movie.dart';

class MoviesRepository implements MyRepository {
  static const String moviesJsonPath = 'assets/data/movies.json';

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
