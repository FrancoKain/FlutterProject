import 'package:flutter/material.dart';
import '../../domain/models/genres.dart';
import '../../core/utils/styles.dart';
import '../../presentation/widgets/genres_card.dart';

class GenresMovieDetails extends StatelessWidget {
  const GenresMovieDetails({
    super.key,
    required this.movieGenres,
  });

  final List<Genre> movieGenres;

  static const double paddingBottomGenres = 15;
  static const double borderRadiusGenreCard = 20;
  static const double paddingGenreSpace = 12;

  static const Color genreColor = MyAppStyles.boxContentLightColor;

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
            for (Genre genre in movieGenres)
              GenreCard(
                borderRadiusGenreCard: borderRadiusGenreCard,
                sizeOfCard: paddingGenreSpace,
                genre: genre.name,
                genreColor: genreColor,
              ),
          ],
        ),
      ),
    );
  }
}
