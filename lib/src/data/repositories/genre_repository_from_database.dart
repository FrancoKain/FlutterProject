import 'package:flutter_project/src/data/datasource/local/movie_database.dart';
import '../../core/utils/state.dart';
import '../../domain/entities/genre.dart';
import '../../domain/repositories/i_genre_repository.dart';

class GenreRepositoryFromDatabase implements MyGenreRepository {
  GenreRepositoryFromDatabase({required this.movieDatabase});

  final MovieDatabase movieDatabase;

  @override
  Future<DataState> getData() async {
    List<Genre> genres = await movieDatabase.getGenres();
    if (genres.isEmpty) {
      return DataState(responseState: ResponseState.empty);
    } else {
      return DataState(
        responseState: ResponseState.success,
        data: genres,
      );
    }
  }
}
