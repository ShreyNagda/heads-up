import 'package:flutter/material.dart';
import 'package:heads_up/main.dart';

class ScoreCard extends StatefulWidget {
  final (String, bool) data;
  const ScoreCard({super.key, required this.data});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  late Color correctColor;
  late Color wrongColor;
  @override
  void initState() {
    correctColor = prefs.get("dark")! == true
        ? Colors.greenAccent.withOpacity(0.6)
        : Colors.greenAccent;
    wrongColor = prefs.get("dark")! == true
        ? Colors.redAccent.withOpacity(0.6)
        : Colors.redAccent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.data.$2 ? correctColor : wrongColor,
      ),
      child: Text(
        widget.data.$1,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
