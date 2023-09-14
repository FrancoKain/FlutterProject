import 'dart:async';
import 'package:flutter_project/src/domain/entities/genres.dart';
import 'package:flutter_project/src/domain/usercase/implementation/get_popular_movies_and_genres.dart';
import 'package:flutter_project/src/presentation/bloc/ipopular_movies_bloc.dart';

import 'package:meta/meta.dart';

import '../../domain/entities/movies_and_genres_response.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends IPopularMoviesBloc{
  StreamController<MovieAndGenresResponse> _movieStream = StreamController<MovieAndGenresResponse>.broadcast();
  @override
  void dispose() {
    _movieStream.close();
  }

  @override
  void initialize() {
    GetPopularMoviesAndGenresUseCase();
  }

  @override
  Stream<MovieAndGenresResponse> get popularMoviesStream => _movieStream.stream;

  @override
  List<Genre> getGenresById(List<int> ids) {
    List<Genre> selectedGenres = [];
    _movieStream.stream.listen((response) {
      selectedGenres = response.genres.where((genre) => ids.contains(genre.id)).toList();
    });
    return selectedGenres;
  }
}

