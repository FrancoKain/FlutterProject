import '../../../core/utils/state.dart';
import '../../../data/repositories/movies_repository.dart';
import '../../repositories/i_repository.dart';

class GetPopularMoviesUseCase implements MyRepository {
  final MoviesRepository movieRepo = MoviesRepository();

  @override
  Future<DataState> getPopularMovies() async {
    return await movieRepo.getPopularMovies();
    ;
  }
}
