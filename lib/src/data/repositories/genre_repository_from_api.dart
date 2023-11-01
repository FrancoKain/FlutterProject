import 'package:flutter_project/src/data/datasource/local/movie_database.dart';

import '../../core/api_constants.dart';
import '../../core/utils/state.dart';
import '../../domain/entities/genre.dart';
import '../datasource/remote/i_api_service.dart';
import '../mappers/to_genre_mapper.dart';
import '../models/genre_page_model.dart';
import '../../domain/repositories/i_genre_repository.dart';

class GenreRepositoryFromApi implements MyGenreRepository {

  GenreRepositoryFromApi({required this.api, required this.movieDatabase,});

  final MovieDatabase movieDatabase;
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
        await saveGenres(genreList);
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

  Future<void> saveGenres(List<Genre> genres) async{
    for(Genre genre in genres){
      await movieDatabase.saveGenre(genre: genre);
    }
  }
}
