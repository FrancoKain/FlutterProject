import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/movie_presentation.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/movie_presentation_image_and_title.dart';
import '../../../lib/src/presentation/widgets/general_widgets/star_rate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify that MoviePresentation widget shows the right amount of widgets of each type',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MoviePresentation(
          moviePoster: '',
          movieOriginalTitle: '',
          movieRate: 0.0,
        ),
      ),
    );
    expect(
      find.byType(StarRate),
      findsOneWidget,
    );
    expect(
      find.byType(MoviePresentationImageTitle),
      findsOneWidget,
    );
  });
}
