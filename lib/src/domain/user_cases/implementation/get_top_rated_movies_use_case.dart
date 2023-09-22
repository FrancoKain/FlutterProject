import 'package:flutter_project/src/core/utils/state.dart';

import '../../../data/repositories/movies_repository.dart';

class GetTopRatedMoviesUseCase{
  final MoviesRepository movieRepo = MoviesRepository();

  Future<DataState> getData() async {
    return await movieRepo.getTopRatedMovies();
  }

}
