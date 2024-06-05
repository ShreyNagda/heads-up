import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String type;
  const GamePage({super.key, required this.type});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    switch (widget.type) {
      case "cricketers":
        print("Crickets");
        break;
      case "movies":
        print("movies");
        break;
      case "words":
        print("words");
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return const Scaffold();
    });
  }
}
