import 'package:flutter_project/src/core/utils/bloc_utils.dart';

import '../../../core/utils/state.dart';
import '../../../data/datasource/remote/movies_api_provider.dart';
import '../../../data/repositories/movies_repository.dart';

class GetMoviesByEndPointUseCase {
  GetMoviesByEndPointUseCase({
    required this.category,
    MoviesRepository? moviesRepository,
  }) : _moviesRepository =
            moviesRepository ?? MoviesRepository(api: ApiMovieService());

  final MoviesRepository _moviesRepository;
  final MovieCategory category;

  Future<DataState> getData() async {
    return await _moviesRepository.getData(category);
  }
}
