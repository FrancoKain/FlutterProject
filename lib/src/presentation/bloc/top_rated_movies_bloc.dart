import 'package:flutter_project/src/core/utils/state.dart';
import 'package:flutter_project/src/domain/user_cases/implementation/get_top_rated_movies_use_case.dart';
import 'package:flutter_project/src/presentation/bloc/bloc.dart';
import 'dart:async';

class TopRatedMoviesBloc extends Bloc {
  late final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  StreamController<DataState> _movieStream =
      StreamController<DataState>.broadcast();

  @override
  void dispose() {
    _movieStream.close();
  }

  @override
  void initialize() async {
    _movieStream.sink.add(DataState(state: ResponseState.loading));
    getTopRatedMoviesUseCase = GetTopRatedMoviesUseCase();
    final movieResponse = await getTopRatedMoviesUseCase.getData();
    _movieStream.sink.add(movieResponse);

  }

  Stream<DataState> get topRatedMoviesStream => _movieStream.stream;
}
