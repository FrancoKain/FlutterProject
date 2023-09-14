import 'package:flutter_project/src/data/datasource/remote/genre_api_provider.dart';

import '../../domain/entities/genres.dart';
import '../../domain/repositories/i_repository.dart';

class GenreRepository implements MyRepository {
  static const String genresJsonPath = 'assets/mock_data/genres.json';
  late Future<List<Genre>> listGenres;

  @override
  Future<List<Genre>> getData() {
    listGenres = GenreApiProvider().fetchGenreList();
    return listGenres;
  }

}
