import 'dart:async';

import '../../domain/entities/movie.dart';
import '../../domain/user_cases/implementation/get_popular_movies_use_case.dart';
import 'bloc.dart';
import '../../core/utils/state.dart';


class PopularMoviesBloc extends Bloc {
  late final GetPopularMoviesUseCase getPopularMoviesUseCase;
  StreamController<DataState> _movieStateStream = StreamController<DataState>.broadcast();

  @override
  void dispose() {
    _movieStateStream.close();
  }

  @override
  void initialize() async {
    getPopularMoviesUseCase = GetPopularMoviesUseCase();
    final movieResponse = await getPopularMoviesUseCase.getPopularMovies();
    _movieStateStream.sink.add(movieResponse);
  }

  @override
  Stream<DataState> get popularMoviesStream => _movieStateStream.stream;
}

