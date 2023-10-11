import 'package:flutter/cupertino.dart';
import 'package:flutter_project/src/core/utils/extensions.dart';

import '../../../core/utils/styles.dart';
import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import '../../bloc/movie_list_page_bloc.dart';
import '../../pages/movie_list_page.dart';
import 'movie_list_information.dart';

class PopularMoviesListView extends StatelessWidget {
  const PopularMoviesListView({
    super.key,
    required this.movieListPageBloc,
    required this.movies,
    required this.genres,
  });

  final List<Genre> genres;
  final MovieListPageBloc movieListPageBloc;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (
        BuildContext context,
         int index,
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
              movie: movies[index],
              genres: genres.getGenresById(
                movies[index].genresIds,
              ),
            ),
          ),
        );
      },
    );
  }
}
