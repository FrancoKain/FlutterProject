import 'package:flutter/material.dart';
import '../../../lib/src/domain/entities/genre.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/genres_details_page.dart';
import '../../../lib/src/presentation/widgets/general_widgets/genres_card.dart';
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
      'Verify that GenresMovieDetails widget renders correctly the right amount of GenreCards',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GenresMovieDetails(movieGenres: genres),
      ),
    );
    expect(
      find.byType(GenreCard),
      findsNWidgets(genres.length),
    );
  });
}
