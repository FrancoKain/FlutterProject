import 'dart:async';

import '../../domain/user_cases/implementation/get_genres_use_case.dart';
import '../../domain/user_cases/implementation/get_movies_by_endpoint_use_case.dart';

import '../../core/bloc/i_bloc.dart';
import '../../core/utils/ui_resource_state.dart';
import '../../core/utils/state.dart';
import '../../core/utils/bloc_utils.dart';

class MovieListPageBloc extends IBloc {
  late GetMoviesByEndPointUseCase getPopularMovies;
  late GetGenresUseCase getGenresUseCase;
  final String endpointNowPlayingMovies = "movie/now_playing?";
  final String endpointPopularMovies = "movie/popular?";
  late GetMoviesByEndPointUseCase getNowPlayingMovies;
  StreamController<UiResourceState> _popularMovieStateStream =
      StreamController<UiResourceState>.broadcast();
  StreamController<UiResourceState> _nowPlayingMovieStateStream =
      StreamController<UiResourceState>.broadcast();

  Stream<UiResourceState> get nowPlayingMoviesStream =>
      _nowPlayingMovieStateStream.stream;

  Stream<UiResourceState> get popularMoviesStream => _popularMovieStateStream.stream;

  MovieListPageBloc() {
    this.getGenresUseCase = GetGenresUseCase();
    this.getNowPlayingMovies = GetMoviesByEndPointUseCase(endpoint: endpointNowPlayingMovies);
    this.getPopularMovies = GetMoviesByEndPointUseCase(endpoint: endpointPopularMovies);
  }

  MovieListPageBloc.fromMock({
    required this.getGenresUseCase,
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
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
        await getPopularMovies.getData();
    final genreResponse = await getGenresUseCase.getGenres();
    _popularMovieStateStream.sink.add(
      checkAndConvertIntoResponse(
        popularMovieResponse,
        genreResponse,
      ),
    );
    final nowPlayingMovieResponse = await getNowPlayingMovies.getData();
    _nowPlayingMovieStateStream.sink.add(
      checkAndConvertIntoResponse(
        nowPlayingMovieResponse,
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
}
