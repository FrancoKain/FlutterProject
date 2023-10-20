import '../../core/api_constants.dart';
import '../../core/utils/state.dart';
import '../../domain/entities/genre.dart';
import '../datasource/remote/i_api_service.dart';
import '../mappers/to_genre_mapper.dart';
import '../models/genre_page_model.dart';
import '../../domain/repositories/i_genre_repository.dart';

class GenreRepository implements MyGenreRepository {

  GenreRepository({required this.api});

  final ApiService api;

  @override
  Future<DataState> getData() async {
    try {
      final GenrePageModel response = await api.fetch("");
      if (response.results.isEmpty) {
        return DataState(responseState: ResponseState.empty);
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
