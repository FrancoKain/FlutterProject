import 'package:flutter/material.dart';
import 'package:flutter_project/local_repository_response.dart';
import 'package:flutter_project/repositories/genre_repository.dart';
import 'package:flutter_project/repositories/movies_repository.dart';
import '../repositories/local_repository.dart';
import '../utils/styles.dart';
import '../widgets/movie_information_from_movie_list.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  static const Color cardColor = Color(0xff2B1C2B);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  LocalRepository local = LocalRepository(
    movieRepo: MoviesRepository(),
    genreRepo: GenreRepository(),
  );
  late Future<LocalRepositoryResponse> data;

  @override
  void initState() {
    data = local.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppStyles.backgroundColor,
      body: FutureBuilder(
        future: data,
        builder: (
          context,
          snapshot,
        ) {
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
              itemCount: snapshot.data!.movies.length,
              itemBuilder: (
                context,
                index,
              ) {
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
                    child: MovieInformationFromMovieList(
                      movie: snapshot.data!.movies[index],
                      genres: local.getGenres(
                        snapshot.data!.movies[index].genresIds,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
