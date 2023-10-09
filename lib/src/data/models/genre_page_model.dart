import 'genre_model.dart';

class GenrePageModel {
  late final List<GenreModel> results;

  GenrePageModel({
    required Map<String, dynamic> json,
  }) {
    results = GenreModel.genreList(
      List.from(
        json['genres'],
      ),
    );
  }
}
