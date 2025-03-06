import 'package:flutter/material.dart';
import 'package:heads_up/pages/game.dart';
import 'package:heads_up/widgets/score_card.dart';

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

  @override
  void initState() {
    for (var i = 0; i < widget.score.values.length; i++) {
      scoreMap[i] = (widget.wordsList[i], widget.score.values.toList()[i]);
      if (widget.score.values.toList()[i] == true) {
        score++;
      }
    }

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
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      children: scoreMap.values
                          .toList()
                          .map((ele) => ScoreCard(data: ele))
                          .toList(),
                    ),
                  ),
                ),
              ),
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
                          horizontal: 30,
                          vertical: 15,
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
