import 'movie_model.dart';

class MoviePageModel {
  late final int page;
  late final List<MovieModel> results;
  late final int totalPages;
  late final int totalResults;

  MoviePageModel({
    required Map<String, dynamic> json,
  }) {
    page = json['page'];
    results = MovieModel.movieList(
      List.from(
        json['results'],
      ),
    );
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}
