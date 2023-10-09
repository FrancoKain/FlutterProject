import 'state.dart';
import 'ui_resource_state.dart';

import '../../domain/entities/genre.dart';
import '../../domain/entities/movies_and_genres_response.dart';

class BlocUtils {
  static List<Genre> getGenres(List<int> ids, List<Genre> genres) {
    List<Genre> selectedGenres = [];
    selectedGenres = genres
        .where(
          (genre) => ids.contains(genre.id),
        )
        .toList();
    return selectedGenres;
  }

  static UiResourceState mapToMovieAndGenresResponse(
    DataState movieResponse,
    DataState genreResponse,
  ) {
    final movieSuccess;
    final genresSuccess;
    switch (movieResponse.responseState) {
      case ResponseState.loading:
        return UiResourceState(
          responseState: UiState.loading,
        );
      case ResponseState.error:
        return UiResourceState(
          responseState: UiState.error,
          error: movieResponse.error,
        );
      case ResponseState.empty:
        return UiResourceState(
          responseState: UiState.empty,
        );
      case ResponseState.success:
        movieSuccess = movieResponse.data;
        switch (genreResponse.responseState) {
          case ResponseState.loading:
            return UiResourceState(
              responseState: UiState.loading,
            );
          case ResponseState.error:
            return UiResourceState(
              responseState: UiState.error,
              error: genreResponse.error,
            );
          case ResponseState.empty:
            return UiResourceState(
              responseState: UiState.empty,
            );
          case ResponseState.success:
            genresSuccess = genreResponse.data;
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
}
