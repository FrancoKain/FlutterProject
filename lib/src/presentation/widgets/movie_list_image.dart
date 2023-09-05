import 'package:flutter/material.dart';

import '../../core/utils/styles.dart';

class MovieListImage extends StatelessWidget {
  const MovieListImage({
    super.key,
    required this.cardSize,
    required this.posterImage,
  });

  final String posterImage;
  final double cardSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          MyAppStyles.movieListPageRadius,
        ),
      ),
      child: Image(
        height: cardSize,
        image: NetworkImage(
          posterImage,
        ),
      ),
    );
  }
}