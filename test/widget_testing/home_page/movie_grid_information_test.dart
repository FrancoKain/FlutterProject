import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../lib/src/domain/entities/genre.dart';
import '../../../lib/src/domain/entities/movie.dart';
import '../../../lib/src/presentation/pages/detail_movie_page.dart';

import '../../../lib/src/presentation/widgets/home_page_widgets/movie_grid_information.dart';
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
    genresIds: [], categories: [],
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

  group('verify animation from card and navigation to details page', () {
    testWidgets(
        'Verify that the floatingButton widget makes the animation appear with the right height ',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MovieGridInformation(
            movie: movie,
            genres: genres,
          ),
        ),
      );
      await tester.tap(find.byKey(const Key('floatingButtonAnimation')));
      await tester.pumpAndSettle();
      final Size baseSize =
          await tester.getSize(find.byType(AnimatedContainer));
      expect(baseSize.height, equals(290.0));
    });
    testWidgets(
        'Verify that the gestureDetector widget makes the navigation right',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MovieGridInformation(
            movie: movie,
            genres: genres,
          ),
        ),
      );
      await tester.tap(find.byKey(const Key('GridViewNavigateToDetails')));
      await tester.pumpAndSettle();
      expect(find.byType(DetailMoviePage), findsOneWidget);
    });
    testWidgets('Verify that the cachedImage widget takes the right path',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MovieGridInformation(
            movie: movie,
            genres: genres,
          ),
        ),
      );
      final CachedNetworkImage image =
          tester.widget(find.byKey(const Key('gridImageKey')));
      expect(
        image.imageUrl,
        equals(movie.fullPosterPath),
      );
    });
  });
}
