import 'package:flutter/material.dart';
import '../../domain/models/local_repository_response.dart';
import '../../data/repositories/genre_repository.dart';
import '../../data/repositories/movies_repository.dart';
import '../../data/repositories/local_repository.dart';
import '../../core/utils/styles.dart';
import '../widgets/movie_list_information.dart';

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
          BuildContext context,
            AsyncSnapshot snapshot,
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
                    child: MovieListInformation(
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
