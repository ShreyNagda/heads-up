import 'package:flutter/material.dart';
import 'package:heads_up/Utils/colors.dart';
import 'package:heads_up/Utils/text.dart';

class Button extends StatelessWidget {
  final String text;
  final Widget next;
  const Button({super.key, required this.text, required this.next});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: secondary),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => next));
        },
        child: Text(
          text,
          style: bodyMediumPriamry,
        ));
  }
}
