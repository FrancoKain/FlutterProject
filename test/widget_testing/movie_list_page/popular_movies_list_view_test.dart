import 'package:flutter/material.dart';
import '../../../lib/src/domain/entities/movie.dart';
import '../../../lib/src/presentation/bloc/movie_list_page_bloc.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/movie_list_information.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/popular_movies_list_view.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final MovieListPageBloc movieListPageBloc = MovieListPageBloc();
  final List<Movie> mockMovieList = [
    Movie(
      id: 1,
      originalTitle: 'title1',
      overview: 'overview',
      title: 'title1',
      rate: 10,
      backDrop: '',
      poster: '',
      genresIds: [],
    ),
    Movie(
      id: 21,
      originalTitle: 'title2',
      overview: 'overview',
      title: 'title2',
      rate: 10,
      backDrop: '',
      poster: '',
      genresIds: [],
    )
  ];

  testWidgets(
      'Verify that PopularMoviesListView widget renders correctly the right amount of MovieListInformation',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PopularMoviesListView(
            movieListPageBloc: movieListPageBloc,
            movies: mockMovieList,
            genres: [],
          ),
        ),
      ),
    );
    expect(
      find.byType(
        MovieListInformation,
      ),
      findsNWidgets(
        mockMovieList.length,
      ),
    );
  });
}
