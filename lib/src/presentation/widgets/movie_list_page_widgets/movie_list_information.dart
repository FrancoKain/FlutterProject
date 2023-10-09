import 'package:flutter/cupertino.dart';
import '../../../domain/entities/genre.dart';

import 'genre_list_movie_list_page.dart';
import '../../../domain/entities/movie.dart';
import '../general_widgets/star_rate.dart';
import '../../../core/utils/styles.dart';
import 'button_to_movie.dart';
import 'movie_list_image.dart';

class MovieListInformation extends StatelessWidget {
  const MovieListInformation({
    super.key,
    required this.movie,
    required this.genres,
  });

  final List<Genre> genres;

  static const double cardSizeHeight = 250;
  static const double titleSizedBoxWidth = 200;
  static const double paddingBetweenImageAndInfo = 10.0;

  final Movie movie;

  static const int movieTitleMaxLines = 3;

  static const Key movieInformationTitleTextKey = Key(
    'movieListInformationTitleText',
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MovieListImage(
          cardSize: cardSizeHeight,
          posterImage: movie.fullPosterPath,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: paddingBetweenImageAndInfo,
          ),
          child: SizedBox(
            height: cardSizeHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: titleSizedBoxWidth,
                  child: Center(
                    child: Text(
                      key: movieInformationTitleTextKey,
                      movie.title,
                      style: MyAppStyles.titles,
                      maxLines: movieTitleMaxLines,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GenreListMovieListPage(
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
