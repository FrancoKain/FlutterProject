import 'package:flutter/cupertino.dart';
import 'package:flutter_project/src/core/utils/extensions.dart';

import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import 'movie_grid_information.dart';

class TopRatedGridView extends StatelessWidget {
  const TopRatedGridView({
    super.key,
    required this.movies,
    required this.genres,
  });

  final List<Movie> movies;
  final List<Genre> genres;

  static const Key gridViewHomePageKey = Key('homePageGridView');

  static const Key movieGridInformationKey = Key('movieGridInformation');

  static const int crossAxisCount = 2;
  static const double crossAxisSpacing = 12;
  static const double childAspectRatio = 0.676;
  static const double paddingTopGridView = 12.0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: gridViewHomePageKey,
      padding: const EdgeInsets.only(top: paddingTopGridView),
      itemCount: movies.length,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return MovieGridInformation(
          key: movieGridInformationKey,
          movie: movies[index],
          genres: genres.getGenresById(movies[index].genresIds),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
    );
  }
}
