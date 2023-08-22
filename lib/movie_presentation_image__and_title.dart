import 'package:flutter/material.dart';
import 'styles.dart';

class MoviePresentationImageTitle extends StatelessWidget {
  const MoviePresentationImageTitle({
    super.key,
    required this.movieBackDrop,
    required this.movieOriginalTitle,
  });

  static const double leftPaddingImageOriginalTitle = 30;
  static const double sizeofOriginalTitleBox = 200;
  static const double borderRadiusBackDrop = 20;
  static const double imageHeightBackDrop = 220;

  static const int originalTitleMaxLines = 3;

  final String movieBackDrop;
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
              borderRadiusBackDrop,
            ),
          ),
          child: Image(
            image: AssetImage(movieBackDrop),
            height: imageHeightBackDrop,
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
