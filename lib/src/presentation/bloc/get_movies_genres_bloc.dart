
import 'dart:async';
import 'package:flutter_project/src/core/utils/state.dart';
import 'package:flutter_project/src/domain/entities/genres.dart';
import 'package:flutter_project/src/domain/user_cases/implementation/get_genres_use_case.dart';

import 'bloc.dart';
class GetMoviesGenresBloc implements Bloc{
  late final GetGenresUseCase getGenresUseCase;

  StreamController<DataState> _genresStream =
  StreamController<DataState>.broadcast();

  @override
  void dispose() {
  _genresStream.close();
  }

  @override
  void initialize() async {
  getGenresUseCase = GetGenresUseCase();
  _genresStream.sink.add(DataState(state: ResponseState.loading));
  final movieResponse = await getGenresUseCase.getPopularMovies();
  _genresStream.sink.add(movieResponse);
  }

  @override
  Stream<DataState> get genresMoviesStream => _genresStream.stream;

  @override
  List<Genre> getGenresById(List<int> ids) {
    List<Genre> selectedGenres = [];
    _genresStream.stream.listen((allGenres) {
      selectedGenres =
          allGenres.data.where((genre) => ids.contains(genre.id)).toList();
    });
    return selectedGenres;
  }

}
