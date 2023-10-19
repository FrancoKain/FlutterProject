import 'dart:core';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/utils/extensions.dart';
import '../../../core/utils/styles.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import '../../pages/detail_movie_page.dart';

class NowPlayingMoviesPageView extends StatelessWidget {
  const NowPlayingMoviesPageView({
    super.key,
    required this.movies,
    required this.allGenres,
  });

  final List<Movie> movies;
  final List<Genre> allGenres;

  static const String nowPlayingTextTitle = "Now Playing";
  static const String gestureDetectorKey = "PageViewNavigateToDetails";

  static const double nowPlayingTitleFontSize = 30;
  static const double pageViewSizeBoxHeight = 700;

  static const double containerPageViewTextHeight = 100;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          scrollDirection: Axis.horizontal,
          children: [
            for (int movieNumber = 0;
                movieNumber < movies.length;
                movieNumber++)
              GestureDetector(
                key: Key("$gestureDetectorKey$movieNumber"),
                onTapUp: (_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailMoviePage(
                        movie: movies[movieNumber],
                        genres: allGenres.getGenresById(
                          movies[movieNumber].genresIds,
                        ),
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: pageViewSizeBoxHeight,
                  child: Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MyAppStyles.movieListPageRadius),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: movies[movieNumber].fullPosterPath,
                    ),
                  ),
                ),
              ),
          ],
        ),
        Container(
          height: containerPageViewTextHeight,
          width: double.infinity,
          color: Colors.black45,
          child: const Center(
            child: Text(
              nowPlayingTextTitle,
              style: TextStyle(
                color: Colors.white54,
                fontSize: nowPlayingTitleFontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
