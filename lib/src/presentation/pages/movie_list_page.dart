import 'package:flutter/material.dart';
import 'package:flutter_project/src/domain/entities/movies_and_genres_response.dart';
import 'package:flutter_project/src/presentation/bloc/popular_movies_bloc.dart';
import '../../core/utils/styles.dart';
import '../widgets/movie_list_information.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({super.key});

  static const Color cardColor = Color(0xff2B1C2B);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  PopularMoviesBloc popularBloc = PopularMoviesBloc();

  late Stream<MovieAndGenresResponse> data;

  @override
  void initState() {
    popularBloc.initialize();
    data = popularBloc.popularMoviesStream;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppStyles.backgroundColor,
      body: StreamBuilder(
        stream: data,
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
          } else if(snapshot.hasData) {
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
                      genres: popularBloc.getGenresById(snapshot.data!.movies[index].genreIds),
                      ),
                    ),
                  );
              },
            );
          }
          else{
            return Text("hola");
          }
        },
      ),
    );
  }
}
