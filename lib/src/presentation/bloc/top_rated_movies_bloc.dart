import '../../core/utils/bloc_utils.dart';
import '../../core/utils/state.dart';
import 'dart:async';

import '../../core/bloc/i_bloc.dart';
import '../../core/utils/ui_resource_state.dart';
import '../../domain/user_cases/implementation/get_genres_use_case.dart';
import '../../domain/user_cases/implementation/get_movies_by_endpoint_use_case.dart';

class TopRatedMoviesBloc extends IBloc {
  late final GetMoviesByEndPointUseCase getTopRatedMovies;
  late final GetGenresUseCase getGenresUseCase;
  StreamController<UiResourceState> _movieStream =
      StreamController<UiResourceState>.broadcast();

  TopRatedMoviesBloc() {
    getTopRatedMovies = GetMoviesByEndPointUseCase(category: MovieCategory.topRated);
    getGenresUseCase = GetGenresUseCase();
  }

  TopRatedMoviesBloc.fromMock({
    required this.getTopRatedMovies,
    required this.getGenresUseCase,
  });

  @override
  void dispose() {
    _movieStream.close();
  }

  @override
  void initialize() async {
    _movieStream.sink.add(
      UiResourceState(responseState: UiState.loading),
    );
    final genreResponse = await getGenresUseCase.getGenres();
    final movieResponse = await getTopRatedMovies.getData();
    _movieStream.sink.add(
      checkAndConvertIntoResponse(
        movieResponse,
        genreResponse,
      ),
    );
  }

  UiResourceState checkAndConvertIntoResponse(
    DataState movieResponse,
    DataState genreResponse,
  ) {
    return mapToMovieAndGenresResponse(
      movieResponse,
      genreResponse,
    );
  }

  Stream<UiResourceState> get topRatedMoviesStream => _movieStream.stream;
}
