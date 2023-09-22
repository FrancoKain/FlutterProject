import 'package:flutter_project/src/presentation/bloc/bloc.dart';
import '../../domain/entities/genres.dart';
import '../../domain/entities/movie.dart';

abstract class IPopularMoviesBloc extends Bloc{
  Stream<List<Movie>> get popularMoviesStream;

}
