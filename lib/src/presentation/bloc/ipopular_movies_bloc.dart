import 'package:flutter_project/src/presentation/bloc/bloc.dart';
import '../../domain/entities/genres.dart';
import '../../domain/entities/movies_and_genres_response.dart';

abstract class IPopularMoviesBloc extends Bloc{
  Stream<MovieAndGenresResponse> get popularMoviesStream;

  List<Genre> getGenresById(List<int> ids);
}
