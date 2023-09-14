import 'package:flutter_project/src/data/models/movie_model.dart';

import '../../domain/entities/movie.dart';

class MovieResponse {
  late final int page;
  late final List<Movie> results;
  late final int totalPages;
  late final int totalResults;

  MovieResponse({
    required Map<String, dynamic> json,
  }) {
    page = json['page'];
    results = MovieModel.movieList(List.from(json['results']));
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }


}
