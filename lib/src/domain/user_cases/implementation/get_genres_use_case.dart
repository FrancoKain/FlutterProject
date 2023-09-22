import 'package:flutter_project/src/core/utils/state.dart';

import '../../entities/genres.dart';
import '../../../data/repositories/genre_repository.dart';

import '../../repositories/i_repository.dart';

class GetGenresUseCase implements MyRepository {
  final GenreRepository genreRepo = GenreRepository();

  @override
  Future<DataState> getPopularMovies() async {
    return await genreRepo.getPopularMovies();
  }
}
