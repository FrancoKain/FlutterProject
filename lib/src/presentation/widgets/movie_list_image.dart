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
    return SizedBox(
      height: cardSize,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            MyAppStyles.movieListPageRadius,
          ),
        ),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(
            posterImage,
          ),
        ),
      ),
    );
  }
}
