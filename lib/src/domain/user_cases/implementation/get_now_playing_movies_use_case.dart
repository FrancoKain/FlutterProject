import '../../../core/utils/state.dart';
import '../../../data/datasource/remote/movies_api_provider.dart';
import '../../../data/datasource/remote/i_api_service.dart';
import '../../../data/repositories/movies_repository.dart';

class GetNowPlayingMoviesUseCase {
  final ApiService api = ApiMovieService();
  late final MoviesRepository movieRepo = MoviesRepository(
    api: api,
  );
  static const String nowPlayingMoviesUrl = "movie/now_playing?";

  Future<DataState> getData() async {
    return await movieRepo.getData(
      nowPlayingMoviesUrl,
    );
  }
}
