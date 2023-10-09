import 'package:flutter/material.dart';
import '../../../lib/src/presentation/widgets/general_widgets/star_rate.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
      'Verify that MovieDetails widget renders correctly the right amount of widgets with the right overview',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: StarRate(
            starColor: Colors.amber,
            rate: 5,
          ),
        ),
      ),
    );
    expect(
      find.byIcon(
        Icons.star,
      ),
      findsNWidgets(
        2,
      ),
    );
    expect(
      find.byIcon(
        Icons.star_half,
      ),
      findsNWidgets(
        1,
      ),
    );
    expect(
      find.byIcon(
        Icons.star_border,
      ),
      findsNWidgets(
        2,
      ),
    );
  });
}
