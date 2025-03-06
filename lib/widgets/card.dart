// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
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
      onTap: () async {
        await Vibrate.vibrate();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Game(
              type: text.toLowerCase(),
            ),
          ),
        );
      },
      child: SizedBox(
          height: MediaQuery.of(context).size.width / 5,
          width: MediaQuery.of(context).size.width / 5,
          child: Card(
              child: Center(
                  child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          )))),
    );
  }
}
