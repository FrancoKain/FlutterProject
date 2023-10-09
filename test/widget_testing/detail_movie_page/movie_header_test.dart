import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/movie_header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify that the MovieHeader widget shows the right image and the title',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MovieHeader(
          movieTitle: 'title',
          movieBackDrop: 'movieBackDrop',
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
        'title',
      ),
    );
    expect(
      image.imageUrl,
      equals(
        'movieBackDrop',
      ),
    );
  });
}
