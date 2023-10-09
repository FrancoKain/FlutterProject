import '../../../core/utils/state.dart';
import '../../../data/datasource/remote/genre_api_provider.dart';
import '../../../data/datasource/remote/i_api_service.dart';
import '../../../data/repositories/genre_repository.dart';

class GetGenresUseCase {
  final ApiService api = GenreApiProvider();
  late final GenreRepository genreRepo = GenreRepository(
    api: api,
  );

  Future<DataState> getGenres() async {
    return await genreRepo.getData(
      "",
    );
  }
}
