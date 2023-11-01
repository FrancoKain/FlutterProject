import 'package:flutter/material.dart';
import 'package:flutter_project/src/core/parameter/init_values.dart';
import 'package:flutter_project/src/core/utils/ui_resource_state.dart';
import 'package:flutter_project/src/domain/entities/movies_and_genres_response.dart';
import 'package:flutter_project/src/presentation/widgets/home_page_widgets/stream_builder_top_rated_movies.dart';
import 'package:flutter_project/src/presentation/widgets/home_page_widgets/top_rated_grid_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  InitCore init = InitCore();
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

  final Stream<UiResourceState> topRatedMoviesDataLoading = Stream.fromFuture(
    getData(1),
  );
  final Stream<UiResourceState> topRatedMoviesDataError = Stream.fromFuture(
    getData(2),
  );
  final Stream<UiResourceState> topRatedMoviesDataSuccess = Stream.fromFuture(
    getData(3),
  );
  final Stream<UiResourceState> topRatedMoviesDataEmpty = Stream.fromFuture(
    getData(4),
  );

  group(
      'Verify that every case of the switch in the streamBuilder works as it should',
      () {
    testWidgets(
        'Verify that StreamBuilderTopRatedMovies widget takes correctly the loading state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: FutureBuilder(
            future: init.initialize(),
            builder: (
              BuildContext context,
              AsyncSnapshot<bool> snapshot,
            ) {
              return Provider<InitCore>(
                create: (context) => init,
                child: StreamBuilderTopRatedMovies(
                  topRatedMoviesData: topRatedMoviesDataLoading,
                ),
              );
            },
          ),
        ),
      );
      await tester.pump();
      expect(
        find.byKey(
          const Key('loadingResponseTopRated'),
        ),
        findsOneWidget,
      );
    });
    testWidgets(
        'Verify that StreamBuilderTopRatedMovies widget takes correctly the error state',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: FutureBuilder(
              future: init.initialize(),
              builder: (
                BuildContext context,
                AsyncSnapshot<bool> snapshot,
              ) {
                return Provider<InitCore>(
                  create: (context) => init,
                  child: StreamBuilderTopRatedMovies(
                    topRatedMoviesData: topRatedMoviesDataError,
                  ),
                );
              })));
      await tester.pumpAndSettle();
      expect(
        find.byKey(
          const Key('errorResponseTopRated'),
        ),
        findsOneWidget,
      );
    });
    testWidgets(
        'Verify that StreamBuilderTopRatedMovies widget takes correctly the success state',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: FutureBuilder(
              future: init.initialize(),
              builder: (
                BuildContext context,
                AsyncSnapshot<bool> snapshot,
              ) {
                return Provider<InitCore>(
                  create: (context) => init,
                  child: StreamBuilderTopRatedMovies(
                    topRatedMoviesData: topRatedMoviesDataSuccess,
                  ),
                );
              })));
      await tester.pumpAndSettle();
      expect(
        find.byType(TopRatedGridView),
        findsOneWidget,
      );
    });
    testWidgets(
        'Verify that StreamBuilderTopRatedMovies widget takes correctly the empty state',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: FutureBuilder(
              future: init.initialize(),
              builder: (
                BuildContext context,
                AsyncSnapshot<bool> snapshot,
              ) {
                return Provider<InitCore>(
                  create: (context) => init,
                  child: StreamBuilderTopRatedMovies(
                    topRatedMoviesData: topRatedMoviesDataEmpty,
                  ),
                );
              })));
      await tester.pumpAndSettle();
      expect(
        find.byKey(
          const Key('emptyResponseTopRated'),
        ),
        findsOneWidget,
      );
    });
  });
}
