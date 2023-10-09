import 'package:flutter/material.dart';
import '../../widgets/home_page_widgets/top_rated_grid_view.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/ui_resource_state.dart';
import '../../bloc/top_rated_movies_bloc.dart';

class StreamBuilderTopRatedMovies extends StatelessWidget {
  const StreamBuilderTopRatedMovies({
    super.key,
    required this.topRatedMoviesBloc,
    required this.topRatedMoviesData,
  });

  final Stream<UiResourceState> topRatedMoviesData;
  final TopRatedMoviesBloc topRatedMoviesBloc;

  static const Key loadingTopRatedState = Key('loadingResponseTopRated');
  static const Key errorTopRatedState = Key('errorResponseTopRated');
  static const Key emptyTopRatedState = Key('emptyResponseTopRated');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: UiResourceState(responseState: UiState.loading),
      stream: topRatedMoviesData,
      builder: (
        BuildContext context,
        AsyncSnapshot<UiResourceState> snapshot,
      ) {
        switch (snapshot.data?.responseState) {
          case UiState.loading:
            return const Center(
              key: loadingTopRatedState,
              child: CircularProgressIndicator(),
            );
          case UiState.error:
            return Center(
              child: Text(
                key: errorTopRatedState,
                snapshot.error.toString(),
              ),
            );
          case UiState.empty:
            return const Text(
              key: emptyTopRatedState,
              MyAppStyles.emptyMessage,
            );
          case UiState.success:
            return TopRatedGridView(
              topRatedMoviesBloc: topRatedMoviesBloc,
              movies: snapshot.data!.data.movies,
              genres: snapshot.data!.data.genres,
            );
          default:
            return const Center(
              child: Text(
                MyAppStyles.defaultMessage,
              ),
            );
        }
      },
    );
  }
}
