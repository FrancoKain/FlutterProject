import '../../../core/utils/state.dart';
import '../../../data/datasource/remote/movies_api_provider.dart';
import '../../../data/repositories/movies_repository.dart';

class GetMoviesByEndPointUseCase {
  GetMoviesByEndPointUseCase({
    required this.endpoint,
    MoviesRepository? moviesRepository,
  }) : _moviesRepository =
            moviesRepository ?? MoviesRepository(api: ApiMovieService());

  final MoviesRepository _moviesRepository;
  final String endpoint;

  Future<DataState> getData() async {
    return await _moviesRepository.getData(endpoint);
  }
}
