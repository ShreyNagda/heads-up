import 'package:flutter/material.dart';
import 'package:heads_up/Utils/text.dart';
import 'package:heads_up/game.dart';
import 'package:heads_up/homepage.dart';
import 'package:heads_up/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    getScore();
    super.initState();
  }

  void getScore() {
    for (var ele in widget.scoreMap.values) {
      if (ele == true) {
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
              Text("Game Over", style: subtitleWhite),
              Text("Your Score: $score", style: bodyLarge),
              Expanded(
                child: Center(
                  child: ListView(children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        widget.scoreMap.length,
                        (index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 1.w,
                              vertical: 0.5.w,
                            ),
                            child: Text(
                              widget.list[index],
                              style: bodySmall.copyWith(
                                color: widget.scoreMap[index] ?? false
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      text: "Play Again!",
                      next: GamePage(type: widget.type),
                    ),
                    const Button(text: "Home", next: Home())
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
