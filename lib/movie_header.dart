import 'package:flutter/material.dart';
import 'styles.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({
    super.key,
    required this.movieTitle,
    required this.moviePoster,
  });

  final String moviePoster;
  final String movieTitle;

  static const double titleTextRadius = 10;
  static const double titleTextHeight = 50;
  static const double borderRadiusImagePoster = 20;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadiusImagePoster),
            child: Image(
              image: AssetImage(moviePoster),
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
                bottom: Radius.circular(titleTextRadius),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
