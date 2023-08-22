import 'package:flutter/material.dart';
import 'package:flutter_project/styles.dart';

import 'genres_card.dart';

class MovieGenres extends StatelessWidget {
  const MovieGenres({
    super.key,
    required this.movieGenres,
  });

  final List movieGenres;

  static const double paddingBottomGenres = 15;
  static const double genreFontSize = 15;
  static const double borderRadiusGenreCard = 20;
  static const double paddingGenreSpace = 12;

  static const TextStyle genreText = TextStyle(
    fontSize: genreFontSize,
    color: Colors.white54,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: paddingBottomGenres,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (String genre in movieGenres)
              GenreCard(
                borderRadiusGenreCard: borderRadiusGenreCard,
                paddingGenreSpace: paddingGenreSpace,
                genre: genre,
                genreText: genreText,
              ),
          ],
        ),
      ),
    );
  }
}
