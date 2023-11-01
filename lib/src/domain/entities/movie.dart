import 'package:floor/floor.dart';

@entity
class Movie {
  static const String imagesLink = 'https://image.tmdb.org/t/p/w500';
  @primaryKey
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final String poster;
  final String backDrop;
  final double rate;
  final List<int> genresIds;
  final List<String> categories;

  String get fullBackdropPath => '$imagesLink$backDrop';

  String get fullPosterPath => '$imagesLink$poster';

  Movie({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.rate,
    required this.backDrop,
    required this.poster,
    required this.genresIds,
    required this.categories,
  });
}
