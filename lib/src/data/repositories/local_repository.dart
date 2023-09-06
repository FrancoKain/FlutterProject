import '../../domain/models/local_repository_response.dart';
import '../../domain/models/genres.dart';
import 'genre_repository.dart';
import 'movies_repository.dart';

import '../../domain/repositories/i_repository.dart';
import '../../domain/models/movie.dart';

class LocalRepository implements MyRepository{
  final MoviesRepository movieRepo;
  final GenreRepository genreRepo;

  LocalRepository({
    required this.movieRepo,
    required this.genreRepo,
  });

  @override
  Future<LocalRepositoryResponse> getData() async {
    List<Movie> movies = await movieRepo.getData();
    List<Genre> genres = await genreRepo.getData();
    return LocalRepositoryResponse(
      movies: movies,
      genres: genres,
    );
  }

  List<Genre> getGenres(List<int> ids) {
    return genreRepo.getGenresById(
      ids,
    );
  }
}
