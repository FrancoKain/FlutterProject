import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../core/utils/state.dart';
import '../../../data/repositories/genre_repository_from_api.dart';
import '../../../data/repositories/genre_repository_from_database.dart';

class GetGenresUseCase {
  GetGenresUseCase(
      {required this.genreRepository,
      required this.genreRepositoryFromDatabase});

  final Connectivity _connectivity = Connectivity();

  final GenreRepositoryFromApi genreRepository;
  final GenreRepositoryFromDatabase genreRepositoryFromDatabase;

  Future<DataState> getGenres() async {
    if (await _connectivity.checkConnectivity() == ConnectivityResult.none) {
      return await genreRepositoryFromDatabase.getData();
    } else {
      return await genreRepository.getData();
    }
  }
}
