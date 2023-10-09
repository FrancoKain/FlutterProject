import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.borderRadiusGenreCard,
    required this.sizeOfCard,
    required this.genre,
    required this.genreColor,
  });

  static const TextStyle genreText = TextStyle(
    fontSize: MyAppStyles.genreFontSize,
    color: Colors.white54,
  );

  final Color genreColor;
  final double borderRadiusGenreCard;
  final double sizeOfCard;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: genreColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadiusGenreCard,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          sizeOfCard,
        ),
        child: Text(
          genre,
          style: genreText,
        ),
      ),
    );
  }
}
