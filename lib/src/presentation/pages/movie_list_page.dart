import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/utils/state.dart';
import 'package:flutter_project/src/presentation/bloc/get_movies_genres_bloc.dart';
import 'package:flutter_project/src/presentation/bloc/popular_movies_bloc.dart';
import '../../core/utils/styles.dart';
import '../../domain/entities/genres.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movies_and_genres_response.dart';
import '../widgets/drawer_app.dart';
import '../widgets/movie_list_information.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  static const Color cardColor = Color(0xff2B1C2B);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  PopularMoviesBloc popularBloc = PopularMoviesBloc();
  GetMoviesGenresBloc genresBloc = GetMoviesGenresBloc();
  late Stream<DataState> genreData;
  late Stream<DataState> movieData;
  late Stream<MovieAndGenresResponse> movieGenreresponse;
  final StreamController<Stream>_movieAndGenreStreamController = StreamController<Stream>.broadcast();
  late Stream<Stream> MovieAndGenreData = _movieAndGenreStreamController.stream;
  final List<Widget> pages = [];

  @override
  void initState() {
    popularBloc.initialize();
    movieData = popularBloc.popularMoviesStream;
    genresBloc.initialize();
    genreData = genresBloc.genresMoviesStream;
    super.initState();
  }

  final PageController _pageController = PageController(initialPage: 0);

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
      body: Column(
        children: [
          StreamBuilder(
            stream: MovieAndGenreData,
            builder: (BuildContext context,
                AsyncSnapshot<> snapshot,) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else {
                return Center();
              }
            }
          ),
            StreamBuilder(
            stream: MovieAndGenreData,
            builder: (BuildContext context,
                AsyncSnapshot<> snapshot,) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                  ),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,
                      index,) {
                    return Padding(
                      padding: const EdgeInsets.all(
                        MyAppStyles.movieListPadding,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            MyAppStyles.movieListPageRadius,
                          ),
                          color: MovieListPage.cardColor,
                        ),
                        child: MovieListInformation(
                          movie: snapshot.data![index],
                          genres: genresBloc
                              .getGenresById(snapshot.data![index].genresIds),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
