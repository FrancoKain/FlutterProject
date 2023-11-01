import '../../data/models/movie_model.dart';
import '../../domain/entities/movie.dart';

import 'mapper.dart';

class ToMovie implements Mapper<MovieModel, Movie> {
  @override
  Movie call(MovieModel movieModel) {
    return Movie(
      title: movieModel.title,
      originalTitle: movieModel.originalTitle,
      overview: movieModel.overview,
      rate: movieModel.voteAverage,
      backDrop: movieModel.backdropPath,
      poster: movieModel.posterPath,
      genresIds: movieModel.genres,
      id: movieModel.id,
      categories: [],
    );
  }
}
