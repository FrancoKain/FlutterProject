import 'models/genres.dart';
import 'models/movie.dart';

class LocalRepositoryResponse {
  final List<Movie> movies;
  final List<Genre> genres;

  LocalRepositoryResponse({
    required this.movies,
    required this.genres,
  });
}
