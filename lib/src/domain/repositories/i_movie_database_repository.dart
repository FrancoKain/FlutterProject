import '../entities/genre.dart';
import '../entities/movie.dart';

abstract class IMovieDatabaseRepository {
  Future<List<Movie>> getMovies(String category);

  Future<bool> existMovieSaved(int id);

  Future<void> saveMovie({required Movie movie});

  Future<void> removeMovie({required Movie movie});

  Future<void> saveGenre({required Genre genre});

  Future<List<Genre>> getGenres();
}
