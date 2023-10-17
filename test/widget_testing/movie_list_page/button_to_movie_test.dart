import 'package:flutter/material.dart';
import '../../../lib/src/domain/entities/genre.dart';
import '../../../lib/src/domain/entities/movie.dart';
import '../../../lib/src/presentation/pages/detail_movie_page.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/button_to_movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Movie movie = Movie(
    id: 1,
    originalTitle: 'title1',
    overview: 'overview',
    title: 'title1',
    rate: 10,
    backDrop: '',
    poster: '',
    genresIds: [],
  );
  final List<Genre> genres = [
    const Genre(
      name: 'Action',
      id: 2,
    ),
    const Genre(
      name: 'Action',
      id: 2,
    ),
  ];

  testWidgets('Verify that the ButtonToMovie widget makes the navigation right',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ButtonToMovie(
            movie: movie,
            genres: genres,
          ),
        ),
      ),
    );
    await tester.tap(
      find.byKey(
        const Key('ButtonNavigateToDetails'),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.byType(DetailMoviePage),
      findsOneWidget,
    );
  });
}
