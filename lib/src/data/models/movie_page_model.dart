import 'movie_model.dart';

class MoviePageModel {
  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  MoviePageModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MoviePageModel.fromJson(Map json) {
    return MoviePageModel(
      page: json['page'],
      results: List.from(json['results'])
          .map((movie) => MovieModel.fromJson(movie))
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
