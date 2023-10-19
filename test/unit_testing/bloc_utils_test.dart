import '../../lib/src/core/utils/bloc_utils.dart';
import '../../lib/src/core/utils/state.dart';
import '../../lib/src/core/utils/ui_resource_state.dart';
import '../../lib/src/domain/entities/genre.dart';
import '../../lib/src/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

List<Movie> _movies = [];
DataState _successMovie = DataState(
  responseState: ResponseState.success,
  data: _movies,
);
List<Genre> _genres = [];
DataState _successGenre = DataState(
  responseState: ResponseState.success,
  data: _genres,
);
DataState _error = DataState(responseState: ResponseState.error);
DataState _empty = DataState(responseState: ResponseState.empty);
DataState _loading = DataState(responseState: ResponseState.loading);

void main() {
  group(
      'verify every option from the switches from the method checkAndConvertIntoResponse()',
      () {
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState error by genreResponse',
        () async {
      final response = mapToMovieAndGenresResponse(
        _successMovie,
        _error,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.error),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState error by movieResponse',
        () async {
      final response = mapToMovieAndGenresResponse(
        _empty,
        _error,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.empty),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState error by MovieResponse',
        () async {
      final response = mapToMovieAndGenresResponse(
        _error,
        _error,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.error),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState loading by movieResponse',
        () async {
      final response = mapToMovieAndGenresResponse(
        _loading,
        _error,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.loading),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState loading by genreResponse',
        () async {
      final response = mapToMovieAndGenresResponse(
        _successMovie,
        _loading,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.loading),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState empty by genreResponse',
        () async {
      final response = mapToMovieAndGenresResponse(
        _successMovie,
        _empty,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.empty),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState success by both responses',
        () async {
      final response = mapToMovieAndGenresResponse(
        _successMovie,
        _successGenre,
      );
      expect(
        response,
        equals(
          UiResourceState(responseState: UiState.success),
        ),
      );
    });
  });
}
