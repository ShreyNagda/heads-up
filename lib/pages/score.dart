
import 'package:flutter/material.dart';
import 'package:heads_up/main.dart';
import 'package:heads_up/pages/game.dart';

class GameScore extends StatefulWidget {
  final Map<int, bool> score;
  final List<String> wordsList;
  final String type;
  const GameScore({
    super.key,
    required this.score,
    required this.wordsList,
    required this.type,
  });

  @override
  State<GameScore> createState() => _GameScoreState();
}

class _GameScoreState extends State<GameScore> {
  int score = 0;
  Map<int, (String, bool)> scoreMap = {};
  late Color correctColor;
  late Color wrongColor;

  @override
  void initState() {
    for (var i = 0; i < widget.score.values.length; i++) {
      scoreMap[i] = (widget.wordsList[i], widget.score.values.toList()[i]);
      if (widget.score.values.toList()[i] == true) {
        score++;
      }
    }
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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(
                "Your Score: $score",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: scoreMap.values
                      .toList()
                      .map(
                        (ele) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ele.$2 ? correctColor : wrongColor,
                          ),
                          child: Text(ele.$1),
                        ),
                      )
                      .toList(),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => Game(
                              type: widget.type,
                            ),
                          ),
                        );
                      },
                      child: const Text("Play Again"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      child: const Text("Home"),
                    ),
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
