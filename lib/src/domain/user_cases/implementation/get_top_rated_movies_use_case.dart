import '../../../core/utils/state.dart';

import '../../../data/datasource/remote/i_api_service.dart';
import '../../../data/datasource/remote/movies_api_provider.dart';
import '../../../data/repositories/movies_repository.dart';

class GetTopRatedMoviesUseCase {
  final ApiService api = ApiMovieService();
  late final MoviesRepository movieRepo = MoviesRepository(
    api: api,
  );
  static const String topRatedMoviesUrl = "movie/top_rated?";

  Future<DataState> getData() async {
    return await movieRepo.getData(
      topRatedMoviesUrl,
    );
  }
}
