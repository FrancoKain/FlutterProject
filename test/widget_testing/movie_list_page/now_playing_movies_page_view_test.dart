import 'package:flutter/material.dart';
import 'package:flutter_project/src/domain/entities/genre.dart';
import 'package:flutter_project/src/domain/entities/movie.dart';
import 'package:flutter_project/src/presentation/pages/detail_movie_page.dart';
import 'package:flutter_project/src/presentation/widgets/movie_list_page_widgets/now_playing_movies_page_view.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final List<Movie> mockMovieList = [
    Movie(
      id: 1,
      originalTitle: 'title1',
      overview: 'overview',
      title: 'title1',
      rate: 10,
      backDrop: '',
      poster: '',
      genresIds: [], categories: [],
    ),
    Movie(
      id: 21,
      originalTitle: 'title2',
      overview: 'overview',
      title: 'title2',
      rate: 10,
      backDrop: '',
      poster: '',
      genresIds: [], categories: [],
    )
  ];
  final List<Genre> genres = [
    const Genre(
      name: 'Action',
      id: 2,
    ),
    const Genre(
      name: 'adventure',
      id: 1,
    ),
  ];
  group(
      'Verify that the gestureDetector widget makes the navigation right and that we have the right amount of widgets',
      () {
    testWidgets(
        'Verify that the gestureDetector widget makes the navigation right',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NowPlayingMoviesPageView(
            movies: mockMovieList,
            allGenres: genres,
          ),
        ),
      );
      await tester.tap(
        find.byKey(
          const Key('PageViewNavigateToDetails0'),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(DetailMoviePage),
        findsOneWidget,
      );
    });
    testWidgets('Verify that we have the right amount of widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NowPlayingMoviesPageView(
            movies: mockMovieList,
            allGenres: genres,
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(
        find.byType(SizedBox),
        findsNWidgets(mockMovieList.length),
      );
    });
  });
}
