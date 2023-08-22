import 'package:flutter/material.dart';
import 'styles.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.borderRadiusGenreCard,
    required this.paddingGenreSpace,
    required this.genre,
    required this.genreText,
  });

  final double borderRadiusGenreCard;
  final double paddingGenreSpace;
  final String genre;
  final TextStyle genreText;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: MyAppStyles.genreColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadiusGenreCard),
      ),
      child: Padding(
        padding: EdgeInsets.all(paddingGenreSpace),
        child: Text(
          genre,
          style: genreText,
        ),
      ),
    );
  }
}
