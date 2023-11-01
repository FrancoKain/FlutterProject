

import 'package:flutter/material.dart';
import 'package:flutter_project/src/domain/entities/movie.dart';
import 'package:flutter_project/src/presentation/widgets/movie_list_page_widgets/movie_list_information.dart';
import 'package:flutter_project/src/presentation/widgets/movie_list_page_widgets/popular_movies_list_view.dart';
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
      'Verify that PopularMoviesListView widget renders correctly the right amount of MovieListInformation',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PopularMoviesListView(
            movies: mockMovieList,
            genres: [],
          ),
        ),
      ),
    );
    expect(
      find.byType(MovieListInformation),
      findsNWidgets(mockMovieList.length),
    );
  });
}
