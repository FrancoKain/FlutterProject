import 'package:flutter/material.dart';
import 'styles.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({
    super.key,
    required this.movieOverview,
  });

  final String movieOverview;

  static const String descriptionText = 'Description';

  TextStyle descriptionTextStyle = const TextStyle(
    fontSize: MyAppStyles.fontText,
    color: Colors.white54,
  );

  static const int maxLinesOverviewText = 10;

  static const double paddingTopBetweenDescriptionOverview = 12;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Center(
            child: Text(
              descriptionText,
              style: MyAppStyles.titles,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: paddingTopBetweenDescriptionOverview,
              ),
              child: Text(
                movieOverview,
                style: descriptionTextStyle,
                textAlign: TextAlign.center,
                maxLines: maxLinesOverviewText,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
