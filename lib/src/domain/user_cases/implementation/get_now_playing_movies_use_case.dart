import 'package:flutter_project/src/core/utils/state.dart';

import '../../../data/repositories/movies_repository.dart';

class GetNowPlayingMoviesUseCase{
  final MoviesRepository movieRepo = MoviesRepository();

  Future<DataState> getData() async {
    return await movieRepo.getNowPlayingMovies();
 ;
  }

}
