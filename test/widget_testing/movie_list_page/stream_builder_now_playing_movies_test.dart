

import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/utils/ui_resource_state.dart';
import 'package:flutter_project/src/domain/entities/movies_and_genres_response.dart';
import 'package:flutter_project/src/presentation/widgets/movie_list_page_widgets/now_playing_movies_page_view.dart';
import 'package:flutter_project/src/presentation/widgets/movie_list_page_widgets/stream_builder_now_playing_movies.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {

  Future<UiResourceState> getData(int numberState) async {
    UiState response;
    switch (numberState) {
      case 1:
        response = UiState.loading;
        break;
      case 2:
        response = UiState.error;
        break;
      case 3:
        response = UiState.success;
        break;
      case 4:
        response = UiState.empty;
        break;
      default:
        response = UiState.empty;
        break;
    }
    if (response == UiState.success)
      return UiResourceState(
        responseState: response,
        data: MovieAndGenresResponse(
          movies: [],
          genres: [],
        ),
      );
    else {
      return UiResourceState(responseState: response);
    }
  }

  final Stream<UiResourceState> nowPlayingMoviesDataLoading = Stream.fromFuture(
    getData(1),
  );
  final Stream<UiResourceState> nowPlayingMoviesDataError = Stream.fromFuture(
    getData(2),
  );
  final Stream<UiResourceState> nowPlayingMoviesDataSuccess = Stream.fromFuture(
    getData(3),
  );
  final Stream<UiResourceState> nowPlayingMoviesDataEmpty = Stream.fromFuture(
    getData(4),
  );

  group(
      'Verify that every case of the switch in the streamBuilder works as it should',
      () {
    testWidgets(
        'Verify that StreamBuilderNowPlayingMovies widget takes correctly the loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StreamBuilderNowPlayingMovies(
            nowPlayingMoviesData: nowPlayingMoviesDataLoading,
          ),
        ),
      );
      await tester.pump();
      expect(
        find.byKey(const Key('loadingResponseNowPlaying')),
        findsOneWidget,
      );
    });
    testWidgets(
        'Verify that StreamBuilderNowPlayingMovies widget takes correctly the error state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StreamBuilderNowPlayingMovies(
            nowPlayingMoviesData: nowPlayingMoviesDataError,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byKey(const Key('errorResponseNowPlaying')),
        findsOneWidget,
      );
    });
    testWidgets(
        'Verify that StreamBuilderNowPlayingMovies widget takes correctly the success state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StreamBuilderNowPlayingMovies(
            nowPlayingMoviesData: nowPlayingMoviesDataSuccess,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(NowPlayingMoviesPageView),
        findsOneWidget,
      );
    });
    testWidgets(
        'Verify that StreamBuilderNowPlayingMovies widget takes correctly the empty state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: StreamBuilderNowPlayingMovies(
            nowPlayingMoviesData: nowPlayingMoviesDataEmpty,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byKey(const Key('emptyResponseNowPlaying')),
        findsOneWidget,
      );
    });
  });
}
