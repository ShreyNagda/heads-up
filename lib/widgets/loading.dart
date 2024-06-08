import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heads_up/Utils/text.dart';

class Loading extends StatefulWidget {
  final String text;
  const Loading({super.key, required this.text});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String text;
  int seconds = 0;
  late Timer timer;
  @override
  void initState() {
    text = widget.text;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      var rem = seconds % 3;
      setState(() {
        text = "$text${" ." * rem}";
        seconds++;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
            Text(
              text,
              style: subtitleWhite,
            ),
          ],
        ),
      ),
    );
  }
}
