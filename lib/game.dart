import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heads_up/Utils/globals.dart';
import 'package:heads_up/Utils/text.dart';
import 'package:heads_up/game_over.dart';
import 'package:heads_up/widgets/game_heading.dart';
import 'package:heads_up/widgets/loading.dart';
import 'package:http/http.dart' as http;
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class GamePage extends StatefulWidget {
  final String type;
  const GamePage({super.key, required this.type});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  String? url;
  String? error;

  bool canVibrate = true;

  double _z = 0.0;
  double threshhold = 8.0;
  double resetThreshold = 0.5;

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;

  bool loading = true;

  int loadingSeconds = 5;
  int gameSeconds = 60;

  int index = 0;

  String message = "";

  Map<int, bool> scoreMap = {};
  bool indexIncremented = false;

  late List list = [];

  Future<void> setupHaptics() async {
    canVibrate = await Vibrate.canVibrate;
  }

  void setupAccelerometer() {
    _accelerometerSubscription =
        accelerometerEventStream(samplingPeriod: SensorInterval.gameInterval)
            .listen((event) async {
      setState(() {
        _z = event.z;
      });
      if (_z.abs() > threshhold && !indexIncremented) {
        Vibrate.feedback(FeedbackType.heavy);
      }
    });
  }

  void setupGameTimer() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        gameSeconds--;
      });
      if (gameSeconds <= 0) {
        _.cancel();
      }
    });
  }

  @override
  void initState() {
    setupHaptics();
    switch (widget.type) {
      case "cricketers":
        url = cricketersURL;
        break;
      case "movies":
        url = moviesURL;
        break;
      case "words":
        url = wordsURL;
        break;
    }
    if (url != null) {
      url = "$url?n=20";
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        var uri = Uri.parse(url!);
        var res = await http.get(uri);
        list = json.decode(res.body)["value"];
        setState(() {
          loading = false;
        });
      });
    } else {
      error = "Invalid URL";
    }

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!loading) {
        setState(() {
          loadingSeconds--;
        });
      }
      if (loadingSeconds < 0) {
        timer.cancel();
        setupHaptics();
        setupAccelerometer();
        setupGameTimer();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (list.length - index == 3) {
      var uri = Uri.parse(url!);
      http.get(uri).then(
            (res) => {
              list.addAll(json.decode(res.body)["value"]),
            },
          );
    }

    if (_z.abs() > threshhold && message == "") {
      if (_z > threshhold) {
        scoreMap[index] = false;
        message = "Pass";
      } else {
        scoreMap[index] = true;
        message = "Correct";
      }
      if (!indexIncremented && index < list.length) {
        index++;
        indexIncremented = true;
      }
    }

    if (indexIncremented == true && _z.abs() < resetThreshold) {
      indexIncremented = false;
      message = "";
    }

    return LayoutBuilder(builder: (context, constraints) {
      //Data is loading
      if (loading) {
        return const Loading(
          text: "Loading Data",
        );
      }

      //Initial Loading 3 seconds
      if (loadingSeconds > 0) {
        return Scaffold(
          body: Center(
            child: Text(
              "Game Starts in $loadingSeconds seconds",
              style: bodyLarge,
            ),
          ),
        );
      }

      //Game over when gameSeconds < 0
      if (gameSeconds <= 0) {
        _accelerometerSubscription?.cancel();
        return GameOver(
          list: list,
          scoreMap: scoreMap,
          type: widget.type,
        );
      }

      //Game loop
      return Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: !indexIncremented
                  ? GameDisplay(
                      type: widget.type,
                      text: list[index],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: message == "Correct" ? Colors.green : Colors.red,
                      ),
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: subtitleWhite,
                        ),
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                "$gameSeconds seconds",
                style: bodyMedium,
              ),
            ),
          ],
        ),
      );
    });
  }
}
