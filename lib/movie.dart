class Movie {
  final String title;
  final String originalTitle;
  final String overview;
  final DateTime? releaseDate;
  final String poster;
  final String backDrop;
  final double rate;
  final List<String> genres;

  Movie({
    this.releaseDate,
    required this.originalTitle,
    required this.overview,
    required this.title,
    required this.backDrop,
    required this.poster,
    required this.rate,
    required this.genres,
  });

  factory Movie.marioBros() {
    return Movie(
      releaseDate: DateTime(2023, 04, 05),
      title: "The Super Mario Bros. Movie",
      overview: 'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.',
      originalTitle: "The Super Mario Bros. Movie",
      poster: "assets/poster.jpg",
      backDrop: "assets/backdrop.jpg",
      rate: 7.8,
      genres: ['Animation', 'Family', 'Adventure', 'Fantasy', 'Comedy'],
    );
  }
}
