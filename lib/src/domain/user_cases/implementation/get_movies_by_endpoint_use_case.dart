import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_project/src/domain/repositories/i_my_repository_from_database.dart';
import 'package:flutter_project/src/domain/repositories/i_repository_from_api.dart';

import '../../../core/utils/movie_category_enum.dart';
import '../../../core/utils/state.dart';

class GetMoviesByEndPointUseCase {
  GetMoviesByEndPointUseCase({
    required this.category,
    required this.moviesRepositoryFromApiService,
    required this.moviesRepositoryFromDataBase,
  });

  final Connectivity _connectivity = Connectivity();
  final MyRepositoryFromApi moviesRepositoryFromApiService;
  final MyRepositoryFromDatabase moviesRepositoryFromDataBase;
  final MovieCategory category;

  Future<DataState> getData() async {
    if (await _connectivity.checkConnectivity() == ConnectivityResult.none) {
      return await moviesRepositoryFromDataBase.getData(category);
    } else {
      return await moviesRepositoryFromApiService.getData(category);
    }
  }
}
