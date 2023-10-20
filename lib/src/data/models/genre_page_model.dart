import 'genre_model.dart';

class GenrePageModel {
  final List<GenreModel> results;

  GenrePageModel({
    required this.results,
  });

  factory GenrePageModel.fromJson(Map json) {
    return GenrePageModel(
      results: List.from(json['genres'])
          .map((genre) => GenreModel.fromJson(genre))
          .toList(),
    );
  }
}
