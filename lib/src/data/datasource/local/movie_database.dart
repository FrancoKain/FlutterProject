import 'package:flutter_project/src/domain/entities/genre.dart';
import 'package:flutter_project/src/domain/repositories/i_movie_database_repository.dart';
import '../../../domain/entities/movie.dart';
import 'floor_movie_database.dart';

class MovieDatabase implements IMovieDatabaseRepository {
  const MovieDatabase(this._movieDatabase);

  final FloorMovieDatabase _movieDatabase;

  @override
  Future<List<Movie>> getMovies(String category) async {
    return _movieDatabase.movieDao.findMoviesByCategory(category);
  }

  @override
  Future<void> removeMovie({required Movie movie}) async {
    _movieDatabase.movieDao.deleteMovieById(movie.id);
  }

  @override
  Future<void> saveMovie({required Movie movie}) async {
    _movieDatabase.movieDao.insertMovie(movie);
  }

  @override
  Future<bool> existMovieSaved(int id) async {
    return await _movieDatabase.movieDao.findMovieById(id) != null;
  }

  @override
  Future<List<Genre>> getGenres() => _movieDatabase.genreDao.getAllGenres();

  @override
  Future<void> saveGenre({required Genre genre}) async {
    _movieDatabase.genreDao.insertGenre(genre);
  }
}
