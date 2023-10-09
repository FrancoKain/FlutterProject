import '../../../core/utils/state.dart';
import '../../../data/datasource/remote/i_api_service.dart';
import '../../../data/datasource/remote/movies_api_provider.dart';
import '../../../data/repositories/movies_repository.dart';

class GetPopularMoviesUseCase {
  final ApiService api = ApiMovieService();
  late final MoviesRepository movieRepo = MoviesRepository(
    api: api,
  );
  static const String popularMoviesUrl = "movie/popular?";

  Future<DataState> getPopularMovies() async {
    return await movieRepo.getData(
      popularMoviesUrl,
    );
  }
}
