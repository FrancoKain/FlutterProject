import '../../data/datasource/local/floor_movie_database.dart';
import '../../data/datasource/remote/genre_api_provider.dart';
import '../../data/datasource/remote/movies_api_provider.dart';
import '../../data/repositories/genre_repository_from_api.dart';
import '../../data/datasource/local/movie_database.dart';
import '../../data/repositories/genre_repository_from_database.dart';
import '../../data/repositories/movie_repository_from_database.dart';
import '../../data/repositories/movies_repository_from_api_service.dart';
import '../../domain/user_cases/implementation/get_genres_use_case.dart';
import '../../domain/user_cases/implementation/get_movies_by_endpoint_use_case.dart';
import '../../presentation/bloc/movie_list_page_bloc.dart';
import '../../presentation/bloc/top_rated_movies_bloc.dart';

import '../utils/movie_category_enum.dart';

class InitCore {
  static const String databaseName = 'movie_database_v2' ;
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
        .databaseBuilder(databaseName)
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
