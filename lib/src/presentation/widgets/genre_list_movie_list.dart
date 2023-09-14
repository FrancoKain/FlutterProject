import 'package:flutter/material.dart';
import '../../domain/entities/genres.dart';
import '../../presentation/widgets/genres_card.dart';
import '../../core/utils/styles.dart';

class GenreListFromJson extends StatelessWidget {
  GenreListFromJson({
    super.key,
    required this.genres,
  });

  final List<Genre> genres;

  late final List<String> genresName =
      genres.map((genre) => genre.name).toList();

  static const Color genreColor = Color(0xff1C091C);

  static const double sizeOfGenreCard = 7;

  static const int genreSize = 2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (String genre in genresName.take(genreSize))
          GenreCard(
            borderRadiusGenreCard: MyAppStyles.movieListPageRadius,
            sizeOfCard: sizeOfGenreCard,
            genre: genre,
            genreColor: genreColor,
          ),
      ],
    );
  }
}
