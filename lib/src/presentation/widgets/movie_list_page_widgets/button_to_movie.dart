import 'package:flutter/material.dart';

import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import '../../pages/detail_movie_page.dart';
import '../../../core/utils/styles.dart';

class ButtonToMovie extends StatelessWidget {
  const ButtonToMovie({super.key, required this.movie, required this.genres});

  final List<Genre> genres;
  final Movie movie;

  static const double buttonWidth = 200;
  static const double buttonHeight = 50;
  static const double buttonTextSize = 15;
  static const double borderRadiusButton = 30;

  static const String buttonText = "See this awesome movie!";

  static const Key buttonToDetailsKey = Key('ButtonNavigateToDetails');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MyAppStyles.movieListPadding),
      child: InkWell(
        key: buttonToDetailsKey,
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
            borderRadius: BorderRadius.circular(borderRadiusButton),
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
