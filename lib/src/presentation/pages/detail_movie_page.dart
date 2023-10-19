import 'package:flutter/material.dart';
import '../../domain/entities/genre.dart';
import '../widgets/detail_movie_page/search_engine.dart';
import '../../core/utils/styles.dart';
import '../widgets/detail_movie_page/button_section.dart';
import '../../domain/entities/movie.dart';
import '../widgets/detail_movie_page/movie_details.dart';
import '../widgets/detail_movie_page/movie_header.dart';
import '../widgets/detail_movie_page/movie_presentation.dart';
import '../widgets/detail_movie_page/genres_details_page.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({
    super.key,
    required this.movie,
    required this.genres,
  });

  static const Key keyScaffold = Key('scaffoldDetailsPage');

  static const Color scaffoldBackground = MyAppStyles.backgroundColor;
  static const Color floatingButtonColor = Color(0xff6D586D);
  static const double paddingBetween = 30;

  final List<Genre> genres;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingButtonColor,
        onPressed: () => Navigator.pop(
          context,
        ),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      backgroundColor: scaffoldBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SearchSection(),
              MovieHeader(
                movieTitle: movie.title,
                movieBackDrop: movie.fullBackdropPath,
              ),
              MoviePresentation(
                moviePoster: movie.fullPosterPath,
                movieOriginalTitle: movie.originalTitle,
                movieRate: movie.rate,
              ),
              MovieDetails(movieOverview: movie.overview),
              const ButtonSection(),
              GenresMovieDetails(movieGenres: genres),
            ]
                .map(
                  (widget) => Padding(
                    padding: const EdgeInsets.only(top: paddingBetween),
                    child: widget,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
