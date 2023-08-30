class Movie {
  static const String imagesLink = 'https://image.tmdb.org/t/p/w500';

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
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.rate,
    required this.backDrop,
    required this.poster,
    required this.genresIds,
  });

  factory Movie.fromJson({
    required Map<String, dynamic> json,
  }) {
    return Movie(
      originalTitle: json['original_title'],
      overview: json['overview'],
      title: json['title'],
      backDrop: json['backdrop_path'],
      poster: json['poster_path'],
      rate: json['vote_average'].toDouble(),
      genresIds: List<int>.from(json['genre_ids']),
      releaseDate: json['release_Date'],
    );
  }
}
