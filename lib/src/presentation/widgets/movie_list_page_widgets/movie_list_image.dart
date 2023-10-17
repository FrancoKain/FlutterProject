import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/utils/styles.dart';

class MovieListImage extends StatelessWidget {
  const MovieListImage({
    super.key,
    required this.cardSize,
    required this.posterImage,
  });

  final String posterImage;
  final double cardSize;

  static const Key sizeBoxMovieListImageKey = Key('sizedBoxMovieListImage');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: sizeBoxMovieListImageKey,
      height: cardSize,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MyAppStyles.movieListPageRadius),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: posterImage,
        ),
      ),
    );
  }
}
