import 'package:flutter_project/src/data/models/genre_model.dart';
import 'package:flutter_project/src/domain/entities/genres.dart';

class GenreResponse{
  late final List<Genre> results;

  GenreResponse({
  required Map<String, dynamic> json,
  }) {
  results = GenreModel.genreList(List.from(json['genres']));
  }
}
