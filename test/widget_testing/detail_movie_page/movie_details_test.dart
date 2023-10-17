import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/movie_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify that MovieDetails widget renders correctly the right amount of widgets with the right overview',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MovieDetails(movieOverview: 'details'),
      ),
    );
    expect(
      find.byKey(
        const Key('detailsPageMovieOverview'),
      ),
      findsOneWidget,
    );
    Text text = tester.widget(
      find.byKey(
        const Key('detailsPageMovieOverview'),
      ),
    );
    expect(
      text.data,
      equals('details'),
    );
    expect(
      find.byType(Text),
      findsNWidgets(2),
    );
  });
}
