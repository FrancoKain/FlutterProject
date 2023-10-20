class Movie {
  static const String imagesLink = 'https://image.tmdb.org/t/p/w500';
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final DateTime? releaseDate;
  final String poster;
  final String backDrop;
  final double rate;
  late List<int> genresIds;

  String get fullBackdropPath => '$imagesLink$backDrop';

  String get fullPosterPath => '$imagesLink$poster';

  Movie({
    this.releaseDate,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.rate,
    required this.backDrop,
    required this.poster,
    required this.genresIds,
  });
}
