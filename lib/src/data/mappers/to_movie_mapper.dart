import 'package:flutter_project/src/data/models/movie_model.dart';
import 'package:flutter_project/src/domain/entities/movie.dart';

import 'mapper.dart';

class ToMovie implements Mapper<MovieModel, Movie> {
  @override
  Movie call(MovieModel object) {
    return Movie(
      title: object.title,
      originalTitle: object.originalTitle,
      overview: object.overview,
      rate: object.voteAverage,
      backDrop: object.backdropPath,
      poster: object.posterPath,
      genresIds: object.genres,
    );
  }
}
