import 'package:flutter_project/src/core/utils/movie_category_enum.dart';
import 'package:flutter_project/src/core/utils/state.dart';
import 'package:flutter_project/src/core/utils/ui_resource_state.dart';
import 'package:flutter_project/src/data/repositories/genre_repository_from_api.dart';
import 'package:flutter_project/src/data/repositories/genre_repository_from_database.dart';
import 'package:flutter_project/src/domain/entities/genre.dart';
import 'package:flutter_project/src/domain/entities/movie.dart';
import 'package:flutter_project/src/domain/repositories/i_my_repository_from_database.dart';
import 'package:flutter_project/src/domain/repositories/i_repository_from_api.dart';
import 'package:flutter_project/src/domain/user_cases/implementation/get_genres_use_case.dart';
import 'package:flutter_project/src/domain/user_cases/implementation/get_movies_by_endpoint_use_case.dart';
import 'package:flutter_project/src/presentation/bloc/movie_list_page_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetPopularMoviesUseCase implements GetMoviesByEndPointUseCase {
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
  // TODO: implement category
  MovieCategory get category => throw UnimplementedError();

  @override
  // TODO: implement moviesRepositoryFromApiService
  MyRepositoryFromApi get moviesRepositoryFromApiService => throw UnimplementedError();

  @override
  // TODO: implement moviesRepositoryFromDataBase
  MyRepositoryFromDatabase get moviesRepositoryFromDataBase => throw UnimplementedError();

}

class MockGetNowPlayingMovies implements GetMoviesByEndPointUseCase {
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
  // TODO: implement category
  MovieCategory get category => throw UnimplementedError();

  @override
  // TODO: implement moviesRepositoryFromApiService
  MyRepositoryFromApi get moviesRepositoryFromApiService =>
      throw UnimplementedError();

  @override
  // TODO: implement moviesRepositoryFromDataBase
  MyRepositoryFromDatabase get moviesRepositoryFromDataBase => throw UnimplementedError();

}

class MockGetGenresUseCase implements GetGenresUseCase {
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

  @override
  // TODO: implement genreRepository
  GenreRepositoryFromApi get genreRepository => throw UnimplementedError();

  @override
  // TODO: implement genreRepositoryFromDatabase
  GenreRepositoryFromDatabase get genreRepositoryFromDatabase => throw UnimplementedError();
}

void main() {
  test(
      'getData() from MovieRepository should return a instance of DataState with a responseState success',
      () async {
    MovieListPageBloc bloc = MovieListPageBloc(
      getGenresUseCase: MockGetGenresUseCase(),
      getNowPlayingMovies: MockGetNowPlayingMovies(),
      getPopularMovies: MockGetPopularMoviesUseCase(),
    );
    Stream popularStream = bloc.popularMoviesStream;
    Stream nowPlayingStream = bloc.nowPlayingMoviesStream;
    expectLater(
      popularStream,
      emitsInOrder([
        UiResourceState(responseState: UiState.loading),
        UiResourceState(
          responseState: UiState.success,
          data: [],
        ),
      ]),
    );
    expectLater(
      nowPlayingStream,
      emitsInOrder([
        UiResourceState(responseState: UiState.loading),
        UiResourceState(
          responseState: UiState.success,
          data: [],
        ),
      ]),
    );
    bloc.initialize();
  });
}
