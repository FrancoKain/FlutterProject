import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/movie_list_page_widgets/movie_list_image.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify that the cachedImage widget takes the right path and the sizedBox has the right height',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MovieListImage(
          cardSize: 100,
          posterImage: 'posterImage',
        ),
      ),
    );
    final CachedNetworkImage image = tester.widget(
      find.byType(
        CachedNetworkImage,
      ),
    );
    final SizedBox sizedBox = tester.widget(
      find.byKey(
        const Key('sizedBoxMovieListImage'),
      ),
    );
    expect(
      image.imageUrl,
      equals('posterImage'),
    );
    expect(
      sizedBox.height,
      equals(100),
    );
  });
}
