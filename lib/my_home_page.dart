import 'package:flutter/material.dart';

import 'search_engine.dart';
import 'styles.dart';
import 'button_section.dart';
import 'movie.dart';
import 'movie_details.dart';
import 'movie_genres.dart';
import 'movie_header.dart';
import 'movie_presentation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Movie movie = Movie.marioBros();

  static const Color scaffoldBackground = Color(0xff1C091C);

  static const double paddingBetween = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                moviePoster: movie.poster,
              ),
              MoviePresentation(
                movieBackDrop: movie.backDrop,
                movieOriginalTitle: movie.originalTitle,
                movieRate: movie.rate,
              ),
              MovieDetails(
                movieOverview: movie.overview,
              ),
              const ButtonSection(),
              MovieGenres(
                movieGenres: movie.genres,
              ),
              //here i would put recommendations
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(top: paddingBetween),
                      child: widget,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
