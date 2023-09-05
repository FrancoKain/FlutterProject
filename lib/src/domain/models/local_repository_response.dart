import 'genres.dart';
import 'movie.dart';

class LocalRepositoryResponse {
  final List<Movie> movies;
  final List<Genre> genres;

  LocalRepositoryResponse({
    required this.movies,
    required this.genres,
  });
}
