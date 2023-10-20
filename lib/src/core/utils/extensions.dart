import '../../domain/entities/genre.dart';

extension getGenres on List<Genre> {
  List<Genre> getGenresById(
      List<int> ids,
      ) {
    List<Genre> selectedGenres = [];
    selectedGenres = this
        .where(
          (genre) => ids.contains(genre.id),
    )
        .toList();
    return selectedGenres;
  }
}
