import 'package:floor/floor.dart';

import '../../../../domain/entities/genre.dart';


@dao
abstract class MovieGenreDao {
  @Query('SELECT * From Genre')
  Future<List<Genre>> getAllGenres();

  @Query('DELETE FROM Genre')
  Future<void> deleteGenre();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenre(Genre movieGenre);
}
