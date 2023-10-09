import 'dart:async';

import '../../domain/user_cases/implementation/get_genres_use_case.dart';
import '../../domain/user_cases/implementation/get_now_playing_movies_use_case.dart';

import '../../core/bloc/bloc.dart';
import '../../core/utils/ui_resource_state.dart';
import '../../domain/entities/genre.dart';
import '../../domain/user_cases/implementation/get_popular_movies_use_case.dart';
import '../../core/utils/state.dart';
import '../../core/utils/bloc_utils.dart';

class MovieListPageBloc extends Bloc {
  late GetPopularMoviesUseCase getPopularMoviesUseCase;
  late GetGenresUseCase getGenresUseCase;
  late GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  StreamController<UiResourceState> _popularMovieStateStream =
      StreamController<UiResourceState>.broadcast();
  StreamController<UiResourceState> _nowPlayingMovieStateStream =
      StreamController<UiResourceState>.broadcast();

  Stream<UiResourceState> get nowPlayingMoviesStream =>
      _nowPlayingMovieStateStream.stream;

  Stream<UiResourceState> get popularMoviesStream => _popularMovieStateStream.stream;

  MovieListPageBloc() {
    this.getGenresUseCase = GetGenresUseCase();
    this.getNowPlayingMoviesUseCase = GetNowPlayingMoviesUseCase();
    this.getPopularMoviesUseCase = GetPopularMoviesUseCase();
  }

  MovieListPageBloc.fromMock({
    required this.getGenresUseCase,
    required this.getNowPlayingMoviesUseCase,
    required this.getPopularMoviesUseCase,
  });

  @override
  void dispose() {
    _popularMovieStateStream.close();
    _nowPlayingMovieStateStream.close();
  }

  @override
  void initialize() async {
    _popularMovieStateStream.sink.add(
      UiResourceState(
        responseState: UiState.loading,
      ),
    );
    _nowPlayingMovieStateStream.sink.add(
      UiResourceState(
        responseState: UiState.loading,
      ),
    );
    final popularMovieResponse =
        await getPopularMoviesUseCase.getPopularMovies();
    final genreResponse = await getGenresUseCase.getGenres();
    _popularMovieStateStream.sink.add(
      checkAndConvertIntoResponse(
        popularMovieResponse,
        genreResponse,
      ),
    );
    final nowPlayingMovieResponse = await getNowPlayingMoviesUseCase.getData();
    _nowPlayingMovieStateStream.sink.add(
      checkAndConvertIntoResponse(
        nowPlayingMovieResponse,
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
}
