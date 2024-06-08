import 'package:flutter/material.dart';
import 'package:heads_up/Utils/colors.dart';
import 'package:heads_up/game.dart';

class CategoryCard extends StatelessWidget {
  final String text;
  final String type;
  const CategoryCard({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GamePage(
              type: type.toLowerCase(),
            ),
          ),
        );
      },
      child: SizedBox(
        width: 200,
        height: 200,
        child: Card(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
