import '../../entities/movies_and_genres_response.dart';
import '../../entities/genres.dart';
import '../../../data/repositories/genre_repository.dart';
import '../../../data/repositories/movies_repository.dart';

import '../../repositories/i_repository.dart';
import '../../entities/movie.dart';

class GetPopularMoviesAndGenresUseCase implements MyRepository{
  final MoviesRepository movieRepo = MoviesRepository();
  final GenreRepository genreRepo = GenreRepository();

  @override
  Future<MovieAndGenresResponse> getData() async {
    List<Movie> movies = await movieRepo.getData();
    List<Genre> genres = await genreRepo.getData();
    return MovieAndGenresResponse(
      movies: movies,
      genres: genres,
    );
  }
}
