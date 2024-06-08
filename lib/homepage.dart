import 'package:flutter/material.dart';
import 'package:heads_up/Utils/text.dart';
import 'package:heads_up/widgets/card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Heads Up",
              style: titlePrimary,
            ),
          ),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoryCard(text: "Cricketers", type: "cricketers"),
                    CategoryCard(text: "Bollywood Movies", type: "movies"),
                    CategoryCard(text: "Objects", type: "words"),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
