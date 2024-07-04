// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:heads_up/pages/game.dart';

class CustomCard extends StatelessWidget {
  final String text;
  const CustomCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Game(
              type: text.toLowerCase(),
            ),
          ),
        );
      },
      child: SizedBox(
          width: 120,
          height: 120,
          child: Card(child: Center(child: Text(text)))),
    );
  }
}
