import '../../../src/core/api_constants.dart';
import '../../core/utils/state.dart';
import '../../domain/entities/genre.dart';
import '../../domain/repositories/i_repository.dart';
import '../datasource/remote/i_api_service.dart';
import '../mappers/to_genre_mapper.dart';
import '../models/genre_page_model.dart';

class GenreRepository implements MyRepository {
  late List<Genre> listGenres;

  GenreRepository({
    required this.api,
  });

  final ApiService api;

  @override
  Future<DataState> getData(
    [String url = ""]
  ) async {
    try {
      final GenrePageModel response = await api.fetch(url);
      if (response.results.isEmpty) {
        return DataState(
          responseState: ResponseState.empty,
        );
      } else {
        List<Genre> genreList = [];
        genreList = response.results.map((e) => ToGenre().call(e)).toList();
        return DataState(
          data: genreList,
          responseState: ResponseState.success,
        );
      }
    } catch (e) {
      return DataState(
        responseState: ResponseState.error,
        error: ApiConstants.errorMessage,
      );
    }
  }
}
