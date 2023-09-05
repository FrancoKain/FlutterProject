import 'package:flutter/material.dart';
import '../../core/utils/styles.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
    required this.movieTitle,
    required this.movieBackDrop,
  });

  final String movieBackDrop;
  final String movieTitle;

  final int headerTitleMaxLines = 1;

  static const double titleTextRadius = 10;
  static const double titleTextHeight = 50;
  static const double borderRadiusImageBackDrop = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(
              borderRadiusImageBackDrop,
            ),
            child: Image(
              image: NetworkImage(
                movieBackDrop,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black45,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Container(
            height: titleTextHeight,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  titleTextRadius,
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.black54,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Text(
                movieTitle,
                style: MyAppStyles.titles,
                maxLines: headerTitleMaxLines,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
