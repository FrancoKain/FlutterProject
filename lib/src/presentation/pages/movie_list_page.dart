import 'dart:async';
import 'package:flutter/material.dart';
import '../bloc/movie_list_page_bloc.dart';
import '../../core/utils/styles.dart';
import '../../core/utils/ui_resource_state.dart';
import '../widgets/general_widgets/drawer_app.dart';
import '../widgets/movie_list_page_widgets/stream_builder_now_playing_movies.dart';
import '../widgets/movie_list_page_widgets/stream_builder_popular_movies.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  static const Color cardColor = Color(
    0xff2B1C2B,
  );

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  MovieListPageBloc movieListPageBloc = MovieListPageBloc();
  late Stream<UiResourceState> nowPlayingMoviesData;
  late Stream<UiResourceState> popularMoviesData;

  @override
  void initState() {
    movieListPageBloc.initialize();
    popularMoviesData = movieListPageBloc.popularMoviesStream;
    nowPlayingMoviesData = movieListPageBloc.nowPlayingMoviesStream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          MyAppStyles.appTitle,
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
        backgroundColor: Colors.black45,
      ),
      drawer: const DrawerApp(),
      backgroundColor: MyAppStyles.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilderNowPlayingMovies(
              nowPlayingMoviesData: nowPlayingMoviesData,
              movieListPageBloc: movieListPageBloc,
            ),
            StreamBuilderPopularMovies(
              popularMoviesData: popularMoviesData,
              movieListPageBloc: movieListPageBloc,
            )
          ],
        ),
      ),
    );
  }
}
