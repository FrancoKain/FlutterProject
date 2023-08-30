import 'package:flutter_project/local_repository_response.dart';
import 'package:flutter_project/models/genres.dart';
import 'package:flutter_project/repositories/genre_repository.dart';
import 'package:flutter_project/repositories/movies_repository.dart';

import '../models/movie.dart';

class LocalRepository {
  final MoviesRepository movieRepo;
  final GenreRepository genreRepo;

  LocalRepository({
    required this.movieRepo,
    required this.genreRepo,
  });

  Future<LocalRepositoryResponse> getData() async {
    List<Movie> movies = await movieRepo.getData();
    List<Genre> genres = await genreRepo.getData();
    return LocalRepositoryResponse(
      movies: movies,
      genres: genres,
    );
  }

  List<Genre> getGenres(List<int> ids) {
    return genreRepo.getGenresById(
      ids,
    );
  }
}
