import '../../domain/entities/movie.dart';

class MovieModel {
  static List<Movie> movieList(List<Map<String, dynamic>> json) {
    List<Movie> movies = [];
    json.forEach((value) {
      movies.add(Movie(
        originalTitle: value['original_title'],
        overview: value['overview'],
        title: value['title'],
        backDrop: value['backdrop_path'],
        poster: value['poster_path'],
        rate: value['vote_average'].toDouble(),
        genresIds: List<int>.from(value['genre_ids']),
        releaseDate: value['release_Date'],
      ));
    });
    return movies;
  }
}
