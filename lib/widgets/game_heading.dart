import 'package:flutter/material.dart';
import 'package:heads_up/Utils/text.dart';

class GameDisplay extends StatelessWidget {
  final String type;
  final String text;
  const GameDisplay({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    if (type == "movies") {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text.split(",")[0],
            style: gameHeading,
            textAlign: TextAlign.center,
          ),
          Text(
            text.split(",")[1],
            style: titleWhite,
            textAlign: TextAlign.center,
          )
        ],
      );
    }
    return Text(
      text,
      style: gameHeading,
    );
  }
}
