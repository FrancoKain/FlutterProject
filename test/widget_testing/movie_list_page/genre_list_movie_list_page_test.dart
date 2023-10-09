import 'package:flutter/material.dart';
import '../../../lib/src/domain/entities/genre.dart';
import '../../../lib/src/presentation/widgets/general_widgets/genres_card.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/genre_list_movie_list_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
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
  testWidgets(
      'Verify that GenreListMovieListPage widget renders correctly the right amount of GenreCards',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GenreListMovieListPage(
          genres: genres,
        ),
      ),
    );
    expect(
      find.byType(
        GenreCard,
      ),
      findsNWidgets(
        GenreListMovieListPage.genreSize,
      ),
    );
  });
}
