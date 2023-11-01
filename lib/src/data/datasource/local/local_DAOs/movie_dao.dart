import 'package:floor/floor.dart';
import '../../../../domain/entities/movie.dart';

@dao
abstract class MovieDao {
  @Query("SELECT * FROM Movie WHERE categories LIKE '%' || :category || '%'")
  Future<List<Movie>> findMoviesByCategory(String category);

  @Query('SELECT * FROM Movie WHERE id = :id')
  Future<Movie?> findMovieById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(Movie movie);

  @Query('DELETE FROM Movie WHERE id = :id')
  Future<void> deleteMovieById(int id);
}
