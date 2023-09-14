import '../../domain/entities/genres.dart';

class GenreModel {

  static List<Genre> genreList(List<Map<String, dynamic>> json) {
    List<Genre> genres = [];
    json.forEach((value) {
      genres.add(Genre(
        id: value['id'],
        name: value['name'],
      )
      );
    });
    return genres;
  }
}
