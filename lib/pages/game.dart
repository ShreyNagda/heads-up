import 'dart:async';
import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:heads_up/pages/loading.dart';
import 'package:heads_up/pages/score.dart';
import 'package:heads_up/widgets/game_card.dart';
import 'package:heads_up/widgets/result_card.dart';
import 'package:http/http.dart' as http;
import 'package:sensors_plus/sensors_plus.dart';
// Import package
import 'package:flutter_vibrate/flutter_vibrate.dart';

class Game extends StatefulWidget {
  final String type;
  const Game({super.key, required this.type});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool loading = true;
  bool startTimerFinished = false;
  List<String> words = [];
  int currentIndex = 0;

  double threshold = 6;
  double resetThreshold = 0.7;

  String? status;
  bool tilted = false;

  Map<int, bool> score = {};

  late Timer timer;
  int startSeconds = 3;
  int gameSeconds = 10;

  double z = 0;
  late StreamSubscription<AccelerometerEvent> _accelerometerSubscription;

  @override
  void initState() {
    super.initState();
    fetchData();
    setUpAccelerometer();
  }

  void setUpAccelerometer() {
    _accelerometerSubscription =
        accelerometerEventStream(samplingPeriod: const Duration(seconds: 1))
            .listen((event) {
      setState(() {
        z = event.z;
      });
    });
  }

  Future<void> fetchData() async {
    var res = await http
        .get(Uri.parse("https://heads-up-jxhg.onrender.com/${widget.type}"));
    var jsonRes = jsonDecode(res.body)["value"];
    for (var i in jsonRes) {
      words.add(i.toString());
    }
    setState(() {
      loading = false;
    });
    if (!startTimerFinished) {
      AssetsAudioPlayer.newPlayer()
          .open(Audio("assets/audios/countdown.wav"), autoStart: true);
      Timer.periodic(const Duration(seconds: 1), (_) {
        if (startSeconds > 1) {
          setState(() {
            startSeconds--;
          });
        } else {
          setState(() {
            startTimerFinished = true;
          });
          _.cancel();
          timer = Timer.periodic(const Duration(seconds: 1), (_) {
            if (gameSeconds > 1) {
              gameSeconds--;
            } else {
              Vibrate.feedback(FeedbackType.heavy);
              _accelerometerSubscription.cancel();
              if (score[currentIndex] == null) {
                score[currentIndex] = false;
              }
              List<String> temp = words.sublist(0, currentIndex + 1);
              // send total words reached as parameter.
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GameScore(
                      score: score, wordsList: temp, type: widget.type),
                ),
              );
              _.cancel();
            }
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _accelerometerSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void accelerometer() {
      if (z.abs() > threshold && !tilted) {
        Vibrate.feedback(FeedbackType.heavy);
        tilted = true;
        if (currentIndex + 3 > words.length) {
          fetchData();
        }
        if (z > threshold) {
          status = "Pass";
        } else if (z < -threshold) {
          status = "Correct";
        }
        score[currentIndex] = status == "Correct";
      } else if (z.abs() < resetThreshold && tilted) {
        tilted = false;
        currentIndex++;
      }
    }

    accelerometer();

    if (loading) {
      return PopScope(canPop: false, child: Loading(text: "Loading"));
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: !startTimerFinished
            ? Center(
                child: Text(
                  "$startSeconds",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Stack(
                children: [
                  Center(
                    child: tilted
                        ? ResultCard(status: status!)
                        : GameCard(
                            type: widget.type, data: words[currentIndex]),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "$gameSeconds",
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
