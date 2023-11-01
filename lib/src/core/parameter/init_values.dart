import 'package:flutter_project/src/data/datasource/local/floor_movie_database.dart';
import 'package:flutter_project/src/data/datasource/remote/genre_api_provider.dart';
import 'package:flutter_project/src/data/datasource/remote/movies_api_provider.dart';
import 'package:flutter_project/src/data/repositories/genre_repository_from_api.dart';
import 'package:flutter_project/src/data/datasource/local/movie_database.dart';
import 'package:flutter_project/src/data/repositories/genre_repository_from_database.dart';
import 'package:flutter_project/src/data/repositories/movie_repository_from_database.dart';
import 'package:flutter_project/src/data/repositories/movies_repository_from_api_service.dart';
import 'package:flutter_project/src/domain/user_cases/implementation/get_genres_use_case.dart';
import 'package:flutter_project/src/domain/user_cases/implementation/get_movies_by_endpoint_use_case.dart';
import 'package:flutter_project/src/presentation/bloc/movie_list_page_bloc.dart';
import 'package:flutter_project/src/presentation/bloc/top_rated_movies_bloc.dart';

import '../utils/movie_category_enum.dart';

class InitCore {
  late MovieListPageBloc _movieListPageBloc;
  late TopRatedMoviesBloc _topRatedMoviesBloc;
  late GetMoviesByEndPointUseCase _getMoviesByEndPointUseCaseTopRated;
  late GetMoviesByEndPointUseCase _getMoviesByEndPointUseCasePopular;
  late GetMoviesByEndPointUseCase _getMoviesByEndPointUseCaseNowPlaying;
  late GetGenresUseCase _getGenresUseCase;
  late ApiMovieService _movieApiService;
  late MoviesRepositoryFromApiService _moviesRepositoryFromApiService;
  late MoviesRepositoryFromDataBase _moviesRepositoryFromDataBase;
  late GenreRepositoryFromApi _genreRepositoryFromApi;
  late GenreRepositoryFromDatabase _genreRepositoryFromDatabase;
  late MovieDatabase _movieDatabase;
  late FloorMovieDatabase _floorDatabase;

  MovieListPageBloc get movieListPageBloc => _movieListPageBloc;

  TopRatedMoviesBloc get topRatedMoviesBloc => _topRatedMoviesBloc;

  Future<bool> initialize() async {
    _floorDatabase = await $FloorFloorMovieDatabase
        .databaseBuilder('movie_database_v2')
        .build();
    _movieApiService = ApiMovieService();
    _movieDatabase = MovieDatabase(_floorDatabase);
    _moviesRepositoryFromApiService = MoviesRepositoryFromApiService(
      api: _movieApiService,
      movieDatabase: _movieDatabase,
    );
    _moviesRepositoryFromDataBase = MoviesRepositoryFromDataBase(
      api: _movieApiService,
      movieDatabase: _movieDatabase,
    );

    _genreRepositoryFromApi = GenreRepositoryFromApi(
      api: GenreApiProvider(),
      movieDatabase: _movieDatabase,
    );
    _genreRepositoryFromDatabase =
        GenreRepositoryFromDatabase(movieDatabase: _movieDatabase);

    _getMoviesByEndPointUseCaseTopRated = GetMoviesByEndPointUseCase(
      category: MovieCategory.topRated,
      moviesRepositoryFromApiService: _moviesRepositoryFromApiService,
      moviesRepositoryFromDataBase: _moviesRepositoryFromDataBase,
    );
    _getMoviesByEndPointUseCasePopular = GetMoviesByEndPointUseCase(
      category: MovieCategory.popular,
      moviesRepositoryFromApiService: _moviesRepositoryFromApiService,
      moviesRepositoryFromDataBase: _moviesRepositoryFromDataBase,
    );
    _getMoviesByEndPointUseCaseNowPlaying = GetMoviesByEndPointUseCase(
      category: MovieCategory.nowPlaying,
      moviesRepositoryFromApiService: _moviesRepositoryFromApiService,
      moviesRepositoryFromDataBase: _moviesRepositoryFromDataBase,
    );
    _getGenresUseCase = GetGenresUseCase(
      genreRepository: _genreRepositoryFromApi,
      genreRepositoryFromDatabase: _genreRepositoryFromDatabase,
    );

    _movieListPageBloc = MovieListPageBloc(
      getGenresUseCase: _getGenresUseCase,
      getNowPlayingMovies: _getMoviesByEndPointUseCaseNowPlaying,
      getPopularMovies: _getMoviesByEndPointUseCasePopular,
    );

    _topRatedMoviesBloc = TopRatedMoviesBloc(
      getTopRatedMovies: _getMoviesByEndPointUseCaseTopRated,
      getGenresUseCase: _getGenresUseCase,
    );

    return true;
  }
}
