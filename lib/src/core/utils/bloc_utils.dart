import 'state.dart';
import 'ui_resource_state.dart';
import '../../domain/entities/movies_and_genres_response.dart';

UiResourceState mapToMovieAndGenresResponse(
  DataState movieResponse,
  DataState genreResponse,
) {
  switch (movieResponse.responseState) {
    case ResponseState.loading:
      return UiResourceState(responseState: UiState.loading);
    case ResponseState.error:
      return UiResourceState(
        responseState: UiState.error,
        error: movieResponse.error,
      );
    case ResponseState.empty:
      return UiResourceState(responseState: UiState.empty);
    case ResponseState.success:
      final movieSuccess = movieResponse.data;
      switch (genreResponse.responseState) {
        case ResponseState.loading:
          return UiResourceState(responseState: UiState.loading);
        case ResponseState.error:
          return UiResourceState(
            responseState: UiState.error,
            error: genreResponse.error,
          );
        case ResponseState.empty:
          return UiResourceState(responseState: UiState.empty);
        case ResponseState.success:
          final genresSuccess = genreResponse.data;
          final MovieAndGenresResponse movieAndGenresResponse =
              MovieAndGenresResponse(
            movies: movieSuccess,
            genres: genresSuccess,
          );
          return UiResourceState(
            responseState: UiState.success,
            data: movieAndGenresResponse,
          );
      }
  }
}
