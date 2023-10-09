import '../../domain/entities/genre.dart';
import '../models/genre_model.dart';
import 'mapper.dart';

class ToGenre implements Mapper<GenreModel, Genre> {
  @override
  Genre call(GenreModel genreModel) {
    return Genre(
      name: genreModel.name,
      id: genreModel.id,
    );
  }
}
