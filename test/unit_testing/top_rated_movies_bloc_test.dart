import '../../lib/src/core/utils/state.dart';
import '../../lib/src/core/utils/ui_resource_state.dart';
import '../../lib/src/data/datasource/remote/i_api_service.dart';
import '../../lib/src/data/repositories/genre_repository.dart';
import '../../lib/src/data/repositories/movies_repository.dart';
import '../../lib/src/domain/entities/genre.dart';
import '../../lib/src/domain/entities/movie.dart';
import '../../lib/src/domain/user_cases/implementation/get_genres_use_case.dart';
import '../../lib/src/domain/user_cases/implementation/get_top_rated_movies_use_case.dart';
import '../../lib/src/presentation/bloc/top_rated_movies_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetTopRatedMoviesUseCase implements GetTopRatedMoviesUseCase {
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
    TopRatedMoviesBloc bloc = TopRatedMoviesBloc.fromMock(
      getGenresUseCase: MockGetGenresUseCase(),
      getTopRatedMoviesUseCase: MockGetTopRatedMoviesUseCase(),
    );
    Stream topRatedStream = bloc.topRatedMoviesStream;
    expectLater(
      topRatedStream,
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
