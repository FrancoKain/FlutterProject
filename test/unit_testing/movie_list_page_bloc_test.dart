import '../../lib/src/core/utils/state.dart';
import '../../lib/src/core/utils/ui_resource_state.dart';
import '../../lib/src/data/datasource/remote/i_api_service.dart';
import '../../lib/src/data/repositories/genre_repository.dart';
import '../../lib/src/data/repositories/movies_repository.dart';
import '../../lib/src/domain/entities/genre.dart';
import '../../lib/src/domain/entities/movie.dart';
import '../../lib/src/domain/user_cases/implementation/get_genres_use_case.dart';
import '../../lib/src/domain/user_cases/implementation/get_now_playing_movies_use_case.dart';
import '../../lib/src/domain/user_cases/implementation/get_popular_movies_use_case.dart';
import '../../lib/src/presentation/bloc/movie_list_page_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetPopularMoviesUseCase implements GetPopularMoviesUseCase {
  @override
  ApiService get api => throw UnimplementedError();

  @override
  Future<DataState> getPopularMovies() {
    List<Movie> movies = [];

    return Future.value(
      DataState(
        responseState: ResponseState.success,
        data: movies,
      ),
    );
  }

  @override
  MoviesRepository get movieRepo => throw UnimplementedError();
}

class MockGetNowPlayingMoviesUseCase implements GetNowPlayingMoviesUseCase {
  @override
  ApiService get api => throw UnimplementedError();

  @override
  Future<DataState> getData() {
    List<Movie> movies = [];
    return Future.value(
      DataState(
        responseState: ResponseState.success,
        data: movies,
      ),
    );
  }

  @override
  MoviesRepository get movieRepo => throw UnimplementedError();
}

class MockGetGenresUseCase implements GetGenresUseCase {
  @override
  ApiService get api => throw UnimplementedError();

  @override
  GenreRepository get genreRepo => throw UnimplementedError();

  @override
  Future<DataState> getGenres() {
    List<Genre> genres = [];
    return Future.value(
      DataState(
        responseState: ResponseState.success,
        data: genres,
      ),
    );
  }
}

void main() {
  test(
      'getData() from MovieRepository should return a instance of DataState with a responseState success',
      () async {
    MovieListPageBloc bloc = MovieListPageBloc.fromMock(
      getGenresUseCase: MockGetGenresUseCase(),
      getNowPlayingMoviesUseCase: MockGetNowPlayingMoviesUseCase(),
      getPopularMoviesUseCase: MockGetPopularMoviesUseCase(),
    );
    Stream popularStream = bloc.popularMoviesStream;
    Stream nowPlayingStream = bloc.nowPlayingMoviesStream;
    expectLater(
      popularStream,
      emitsInOrder([
        UiResourceState(
          responseState: UiState.loading,
        ),
        UiResourceState(
          responseState: UiState.success,
          data: [],
        ),
      ]),
    );
    expectLater(
      nowPlayingStream,
      emitsInOrder([
        UiResourceState(
          responseState: UiState.loading,
        ),
        UiResourceState(
          responseState: UiState.success,
          data: [],
        ),
      ]),
    );
    bloc.initialize();
  });
}
