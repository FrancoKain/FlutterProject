import '../../core/utils/bloc_utils.dart';
import '../../core/utils/state.dart';
import '../../domain/user_cases/implementation/get_top_rated_movies_use_case.dart';
import 'dart:async';

import '../../core/bloc/bloc.dart';
import '../../core/utils/ui_resource_state.dart';
import '../../domain/entities/genre.dart';
import '../../domain/user_cases/implementation/get_genres_use_case.dart';

class TopRatedMoviesBloc extends Bloc {
  late final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  late final GetGenresUseCase getGenresUseCase;
  StreamController<UiResourceState> _movieStream =
      StreamController<UiResourceState>.broadcast();

  TopRatedMoviesBloc(){
    getTopRatedMoviesUseCase = GetTopRatedMoviesUseCase();
    getGenresUseCase = GetGenresUseCase();
  }
  TopRatedMoviesBloc.fromMock({
    required this.getTopRatedMoviesUseCase,
    required this.getGenresUseCase,
});

  @override
  void dispose() {
    _movieStream.close();
  }

  @override
  void initialize() async {
    _movieStream.sink.add(
      UiResourceState(
        responseState: UiState.loading,
      ),
    );
    final genreResponse = await getGenresUseCase.getGenres();
    final movieResponse = await getTopRatedMoviesUseCase.getData();
    _movieStream.sink.add(
      checkAndConvertIntoResponse(
        movieResponse,
        genreResponse,
      ),
    );
  }

  List<Genre> getGenresById(List<int> ids, List<Genre> genres) {
    return BlocUtils.getGenres(
      ids,
      genres,
    );
  }

  UiResourceState checkAndConvertIntoResponse(
    DataState movieResponse,
    DataState genreResponse,
  ) {
    return BlocUtils.mapToMovieAndGenresResponse(
      movieResponse,
      genreResponse,
    );
  }

  Stream<UiResourceState> get topRatedMoviesStream => _movieStream.stream;
}
