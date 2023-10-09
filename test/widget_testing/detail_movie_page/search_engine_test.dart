import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/detail_movie_page/search_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify that SearchSection widget shows the right icon and text',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchSection(),
      ),
    );
    final Text text = tester.widget(
      find.byType(
        Text,
      ),
    );
    final Icon icon = tester.widget(
      find.byType(
        Icon,
      ),
    );
    expect(
      text.data,
      equals('Search'),
    );
    expect(
      icon.icon,
      equals(
        Icons.search,
      ),
    );
  });
}
