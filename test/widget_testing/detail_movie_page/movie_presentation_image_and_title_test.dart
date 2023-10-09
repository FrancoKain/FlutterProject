import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/movie_presentation_image_and_title.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify that the MoviePresentationImageTitle widget shows the right image and the originalTitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MoviePresentationImageTitle(
          moviePoster: 'moviePoster',
          movieOriginalTitle: 'originalTitle',
        ),
      ),
    );
    final CachedNetworkImage image = tester.widget(
      find.byType(
        CachedNetworkImage,
      ),
    );
    Text text = tester.widget(
      find.byType(
        Text,
      ),
    );
    expect(
      text.data,
      equals(
        'originalTitle',
      ),
    );
    expect(
      image.imageUrl,
      equals(
        'moviePoster',
      ),
    );
  });
}
