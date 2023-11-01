import 'package:flutter/material.dart';
import '../../../lib/src/domain/entities/movie.dart';
import '../../../lib/src/presentation/widgets/general_widgets/star_rate.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/genre_list_movie_list_page.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/movie_list_information.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Movie movie = Movie(
    id: 1,
    originalTitle: 'title1',
    overview: 'overview',
    title: 'title1',
    rate: 10,
    backDrop: '',
    poster: '',
    genresIds: [], categories: [],
  );
  testWidgets('Verify that we have the right amount of widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieListInformation(
            movie: movie,
            genres: [],
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.byType(StarRate),
      findsOneWidget,
    );
    expect(
      find.byType(GenreListMovieListPage),
      findsOneWidget,
    );
    final Text text = tester.widget(
      find.byKey(
        const Key('movieListInformationTitleText'),
      ),
    );
    expect(
      find.byKey(
        const Key('movieListInformationTitleText'),
      ),
      findsOneWidget,
    );
    expect(
      text.data,
      equals(movie.title),
    );
  });
}
