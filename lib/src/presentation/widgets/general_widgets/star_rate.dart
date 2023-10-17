import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  const StarRate({
    super.key,
    required this.starColor,
    required this.rate,
  });

  final double rate;
  static const double maxStars = 5;
  static const double rateTextSize = 20;
  static const double paddingLeftBetweenStarsRate = 8.0;
  static const double paddingLeftStars = 10;
  static const double paddingTopBetweenImageStars = 12;

  final Color starColor;

  Icon starCreate(
    int starNumber,
    double rate,
    Color starColor,
  ) {
    rate = rate / 2;
    if (starNumber < rate.floor()) {
      return Icon(
        Icons.star,
        color: starColor,
      );
    } else {
      if (rate.round() > starNumber && rate > starNumber) {
        return Icon(
          Icons.star_half,
          color: starColor,
        );
      } else {
        return Icon(
          Icons.star_border,
          color: starColor,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: paddingLeftStars,
        top: paddingTopBetweenImageStars,
      ),
      child: Row(
        children: [
          for (int starNumber = 0; starNumber < maxStars; starNumber++)
            starCreate(
              starNumber,
              rate,
              starColor,
            ),
          Padding(
            padding: const EdgeInsets.only(left: paddingLeftBetweenStarsRate),
            child: Text(
              "$rate",
              style: const TextStyle(
                fontSize: rateTextSize,
                color: Colors.white70,
              ),
            ),
          )
        ],
      ),
    );
  }
}
