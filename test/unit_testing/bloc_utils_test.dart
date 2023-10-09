import '../../lib/src/core/utils/bloc_utils.dart';
import '../../lib/src/core/utils/state.dart';
import '../../lib/src/core/utils/ui_resource_state.dart';
import '../../lib/src/domain/entities/genre.dart';
import '../../lib/src/domain/entities/movie.dart';
import 'package:flutter_test/flutter_test.dart';

List<Movie> movies = [];
DataState successMovie = DataState(
  responseState: ResponseState.success,
  data: movies,
);
List<Genre> genres = [];
DataState successGenre = DataState(
  responseState: ResponseState.success,
  data: genres,
);
DataState error = DataState(
  responseState: ResponseState.error,
);
DataState empty = DataState(
  responseState: ResponseState.empty,
);
DataState loading = DataState(
  responseState: ResponseState.loading,
);

void main() {
  group(
      'verify every option from the switches from the method checkAndConvertIntoResponse()',
      () {
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState error by genreResponse',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        successMovie,
        error,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.error,
          ),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState error by movieResponse',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        empty,
        error,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.empty,
          ),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState error by MovieResponse',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        error,
        error,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.error,
          ),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState loading by movieResponse',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        loading,
        error,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.loading,
          ),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState loading by genreResponse',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        successMovie,
        loading,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.loading,
          ),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState empty by genreResponse',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        successMovie,
        empty,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.empty,
          ),
        ),
      );
    });
    test(
        'method checkAndConvertIntoResponse() from BlocUtils should return a instance of DataState with a responseState success by both responses',
        () async {
      final response = BlocUtils.mapToMovieAndGenresResponse(
        successMovie,
        successGenre,
      );
      expect(
        response,
        equals(
          UiResourceState(
            responseState: UiState.success,
          ),
        ),
      );
    });
  });
}
