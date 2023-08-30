import 'package:flutter/material.dart';

import '../models/genres.dart';
import '../models/movie.dart';
import '../pages/detail_movie_page.dart';
import '../utils/styles.dart';

class ButtonToMovie extends StatelessWidget {
  const ButtonToMovie({super.key, required this.movie, required this.genres});

  final List<Genre> genres;
  final Movie movie;

  static const double buttonWidth = 200;
  static const double buttonHeight = 50;
  static const double buttonTextSize = 15;
  static const double borderRadiusButton = 30;

  static const String buttonText = "See this awesome movie!";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MyAppStyles.movieListPadding,
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMoviePage(
              movie: movie,
              genres: genres,
            ),
          ),
        ),
        child: Container(
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: MyAppStyles.boxContentLightColor,
            borderRadius: BorderRadius.circular(
              borderRadiusButton,
            ),
          ),
          child: const Center(
            child: Text(
              buttonText,
              style: TextStyle(
                color: Colors.white,
                fontSize: buttonTextSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
