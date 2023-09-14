import 'package:flutter/cupertino.dart';
import '../../domain/entities/genres.dart';

import 'genre_list_movie_list.dart';
import '../../domain/entities/movie.dart';
import 'star_rate.dart';
import '../../core/utils/styles.dart';
import 'button_to_movie.dart';
import 'movie_list_image.dart';

class MovieListInformation extends StatelessWidget {
  const MovieListInformation({
    super.key,
    required this.movie,
    required this.genres,
  });

  final List<Genre> genres;

  static const double cardSize = 250;
  static const double titleSizedBoxWidth = 200;
  static const double paddingBetweenImageAndInfo = 10.0;

  final Movie movie;

  static const int movieTitleMaxLines = 3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MovieListImage(
          cardSize: cardSize,
          posterImage: movie.fullPosterPath,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: paddingBetweenImageAndInfo,
          ),
          child: SizedBox(
            height: cardSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: titleSizedBoxWidth,
                  child: Center(
                    child: Text(
                      movie.title,
                      style: MyAppStyles.titles,
                      maxLines: movieTitleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GenreListFromJson(
                  genres: genres,
                ),
                StarRate(
                  starColor: MyAppStyles.starColor,
                  rate: movie.rate,
                ),
                ButtonToMovie(
                  movie: movie,
                  genres: genres,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
