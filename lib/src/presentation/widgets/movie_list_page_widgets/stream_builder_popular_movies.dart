import 'package:flutter/material.dart';
import '../../widgets/movie_list_page_widgets/popular_movies_list_view.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/ui_resource_state.dart';

class StreamBuilderPopularMovies extends StatelessWidget {
  const StreamBuilderPopularMovies({
    super.key,
    required this.popularMoviesData,
  });

  final Stream<UiResourceState> popularMoviesData;

  static const Key loadingPopularState = Key('loadingResponsePopular');
  static const Key errorPopularState = Key('errorResponsePopular');
  static const Key emptyPopularState = Key('emptyResponsePopular');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: popularMoviesData,
      initialData: UiResourceState(responseState: UiState.loading),
      builder: (
        BuildContext context,
        AsyncSnapshot<UiResourceState> snapshot,
      ) {
        switch (snapshot.data?.responseState) {
          case UiState.loading:
            return const Center(
              key: loadingPopularState,
              child: CircularProgressIndicator(),
            );
          case UiState.error:
            return Center(
              key: errorPopularState,
              child: Text(
                snapshot.error.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          case UiState.empty:
            return const Text(
              key: emptyPopularState,
              MyAppStyles.emptyMessage,
              style: TextStyle(color: Colors.white),
            );
          case UiState.success:
            return PopularMoviesListView(
              movies: snapshot.data!.data.movies,
              genres: snapshot.data!.data.genres,
            );
          default:
            return const Center(
              child: Text(MyAppStyles.defaultMessage),
            );
        }
      },
    );
  }
}
