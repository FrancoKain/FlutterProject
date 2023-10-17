import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
import '../../../core/utils/ui_resource_state.dart';
import '../../bloc/movie_list_page_bloc.dart';
import 'now_playing_movies_page_view.dart';

class StreamBuilderNowPlayingMovies extends StatelessWidget {
  const StreamBuilderNowPlayingMovies({
    super.key,
    required this.movieListPageBloc,
    required this.nowPlayingMoviesData,
  });

  final Stream<UiResourceState> nowPlayingMoviesData;
  final MovieListPageBloc movieListPageBloc;

  static const Key loadingNowPlayingState = Key('loadingResponseNowPlaying');
  static const Key errorNowPlayingState = Key('errorResponseNowPlaying');
  static const Key emptyNowPlayingState = Key('emptyResponseNowPlaying');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: StreamBuilder(
        initialData: UiResourceState(responseState: UiState.loading),
        stream: nowPlayingMoviesData,
        builder: (
          BuildContext context,
          AsyncSnapshot<UiResourceState> snapshot,
        ) {
          switch (snapshot.data?.responseState) {
            case UiState.loading:
              return const Center(
                key: loadingNowPlayingState,
                child: CircularProgressIndicator(),
              );
            case UiState.error:
              return Center(
                child: Text(
                  key: errorNowPlayingState,
                  snapshot.error.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            case UiState.empty:
              return const Text(
                key: emptyNowPlayingState,
                MyAppStyles.emptyMessage,
                style: TextStyle(color: Colors.white),
              );
            case UiState.success:
              return nowPlayingMoviesPageView(
                movies: snapshot.data!.data.movies,
                allGenres: snapshot.data!.data.genres,
                bloc: movieListPageBloc,
              );
            default:
              return const Center(
                child: Text(MyAppStyles.defaultMessage),
              );
          }
        },
      ),
    );
  }
}
