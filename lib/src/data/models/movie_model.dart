class MovieModel {
  final String title;
  final String originalTitle;
  final String originalLanguage;
  final int id;
  final bool adult;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final List<int> genres;
  final String posterPath;
  final String backdropPath;
  final double popularity;
  final bool video;
  final int voteCount;

  MovieModel({
    required this.title,
    required this.originalTitle,
    required this.originalLanguage,
    required this.id,
    required this.adult,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.posterPath,
    required this.backdropPath,
    required this.popularity,
    required this.video,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map json) {
    return MovieModel(
      title: json['title'],
      originalTitle: json['original_title'],
      originalLanguage: json['original_language'],
      id: json['id'] as int,
      adult: json['adult'] as bool,
      releaseDate: json['release_date'],
      overview: json['overview'] as String,
      voteAverage: json['vote_average'].toDouble(),
      genres: List<int>.from(json['genre_ids']),
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      popularity: json['popularity'].toDouble(),
      video: json['video'] as bool,
      voteCount: json['vote_count'] as int,
    );
  }
}
