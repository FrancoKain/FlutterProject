import 'genres.dart';
import 'movie.dart';

class MovieAndGenresResponse {
  final List<Movie> movies;
  final List<Genre> genres;

  MovieAndGenresResponse({
    required this.movies,
    required this.genres,
  });
}
