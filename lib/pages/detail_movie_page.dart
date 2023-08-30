import 'package:flutter/material.dart';

import '../models/genres.dart';
import '../widgets/search_engine.dart';
import '../utils/styles.dart';
import '../widgets/button_section.dart';
import '../models/movie.dart';
import '../widgets/movie_details.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_presentation.dart';
import '../widgets/genres_details_page.dart';

class DetailMoviePage extends StatelessWidget {
   const DetailMoviePage({
    super.key,
    required this.movie, required this.genres,
  });

  static const Color scaffoldBackground = MyAppStyles.backgroundColor;
  static const Color floatingButtonColor = Color(0xff6D586D);
  static const double paddingBetween = 30;

  final List<Genre> genres;
  final Movie movie;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        leading: const Icon(
          Icons.person,
          color: Colors.white,
        ),
        title: const Text(
          MyAppStyles.appTitle,
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black45,
      ),
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
              MovieDetails(
                movieOverview: movie.overview,
              ),
              const ButtonSection(),
              GenresMovieDetails(
                movieGenres: genres,
              ),

              //here i would put recommendations
            ]
                .map((widget) => Padding(
              padding: const EdgeInsets.only(
                top: paddingBetween,
              ),
              child: widget,
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
