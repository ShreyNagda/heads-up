import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final String type;
  final String data;
  const GameCard({super.key, required this.type, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: type == "movies"
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.split(",").first,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  data.split(",").last,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            )
          : Text(
              data,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}
