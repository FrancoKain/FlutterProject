import 'package:flutter/material.dart';
import '../utils/styles.dart';

class MoviePresentationImageTitle extends StatelessWidget {
  const MoviePresentationImageTitle({
    super.key,
    required this.moviePoster,
    required this.movieOriginalTitle,
  });

  static const double leftPaddingImageOriginalTitle = 30;
  static const double sizeofOriginalTitleBox = 200;
  static const double borderRadiusPoster = 20;
  static const double imageHeightPoster = 220;

  static const int originalTitleMaxLines = 3;

  final String moviePoster;
  final String movieOriginalTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadiusPoster,
            ),
          ),
          child: Image(
            image: NetworkImage(
              moviePoster,
            ),
            height: imageHeightPoster,
          ),
        ),
        SizedBox(
          width: sizeofOriginalTitleBox,
          child: Padding(
            padding: const EdgeInsets.only(
              left: leftPaddingImageOriginalTitle,
            ),
            child: Text(
              movieOriginalTitle,
              style: MyAppStyles.titles,
              maxLines: originalTitleMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
