import 'package:flutter/material.dart';
import 'movie_presentation_image__and_title.dart';
import 'star_rate.dart';

const Color starColor = Colors.yellow;

class MoviePresentation extends StatelessWidget {
  const MoviePresentation({
    super.key,
    required this.movieBackDrop,
    required this.movieOriginalTitle,
    required this.movieRate,
  });

  final String movieBackDrop;
  final String movieOriginalTitle;
  final double movieRate;

  static const double leftPaddingListView = 15;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: leftPaddingListView,
      ),
      child: Column(
        children: [
          MoviePresentationImageTitle(
            movieBackDrop: movieBackDrop,
            movieOriginalTitle: movieOriginalTitle,
          ),
          StarRate(
            rate: movieRate,
            starColor: starColor,
          ),
        ],
      ),
    );
  }
}
