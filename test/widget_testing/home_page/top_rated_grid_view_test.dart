

import 'package:flutter/material.dart';
import 'package:flutter_project/src/domain/entities/movie.dart';
import 'package:flutter_project/src/presentation/widgets/home_page_widgets/top_rated_grid_view.dart';
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

  testWidgets(
      'Verify that TopRatedGridView widget renders correctly and the right amount of widgets of movies',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: TopRatedGridView(
          movies: mockMovieList,
          genres: [],
        ),
      ),
    );
    expect(
      find.byKey(
        const Key('homePageGridView'),
      ),
      findsOneWidget,
    );
    expect(
      find.byKey(
        const Key('movieGridInformation'),
      ),
      findsNWidgets(2),
    );
  });
}
