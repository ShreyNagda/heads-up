import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heads_up/Utils/colors.dart';
import 'package:heads_up/game.dart';
import 'package:heads_up/homepage.dart';

class GameOver extends StatefulWidget {
  final List<dynamic> list;
  final Map<int, bool> scoreMap;
  final String type;
  const GameOver(
      {super.key,
      required this.list,
      required this.scoreMap,
      required this.type});

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  var score = 0;
  @override
  void initState() {
    print(widget.list.length);
    getScore();
    super.initState();
  }

  void getScore() {
    for (var ele in widget.scoreMap.values) {
      if (ele) {
        score++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Game Over", style: Theme.of(context).textTheme.titleMedium),
              Text("Your Score: $score",
                  style: Theme.of(context).textTheme.titleSmall),
              Expanded(
                  child: Center(
                child: Wrap(
                  children: List.generate(
                    widget.scoreMap.length,
                    (index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(widget.list[index],
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: widget.scoreMap[index]!
                                          ? Colors.white
                                          : Colors.grey,
                                    )),
                      );
                    },
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GamePage(type: widget.type),
                          ),
                        );
                      },
                      child: Text(
                        "Play Again",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: primary,
                            ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15.0)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: primary,
                            ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
