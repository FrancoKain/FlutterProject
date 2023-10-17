import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
import 'movie_presentation_image_and_title.dart';
import '../general_widgets/star_rate.dart';

class MoviePresentation extends StatelessWidget {
  const MoviePresentation({
    super.key,
    required this.moviePoster,
    required this.movieOriginalTitle,
    required this.movieRate,
  });

  final String moviePoster;
  final String movieOriginalTitle;
  final double movieRate;

  static const double leftPaddingListView = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: leftPaddingListView),
      child: Column(
        children: [
          MoviePresentationImageTitle(
            moviePoster: moviePoster,
            movieOriginalTitle: movieOriginalTitle,
          ),
          StarRate(
            rate: movieRate,
            starColor: MyAppStyles.starColor,
          ),
        ],
      ),
    );
  }
}
