import 'package:flutter/material.dart';
import '../../core/utils/styles.dart';

class ButtonSection extends StatefulWidget {
  const ButtonSection({
    super.key,
  });

  @override
  State<ButtonSection> createState() => _ButtonSectionState();
}

class _ButtonSectionState extends State<ButtonSection> {
  int _counter = 0;
  static const Color buttonColor = Color(0xffAB0034);

  static const String counterText = 'People who liked the movie: ';

  static const double paddingBetweenCounterTextAndButton = 15;
  static const double likeButtonSize = 50;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "$counterText$_counter",
            style: const TextStyle(
              fontSize: MyAppStyles.fontText,
              color: buttonColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: paddingBetweenCounterTextAndButton,
            ),
            child: Stack(
              children: [
                InkWell(
                  onTap: _incrementCounter,
                  child: Container(
                    width: likeButtonSize,
                    height: likeButtonSize,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: buttonColor,
                    ),
                    child: const Icon(Icons.favorite),
                  ),
                ),
                Text(
                  "$_counter",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
