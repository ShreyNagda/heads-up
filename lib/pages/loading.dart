// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  String text;
  Loading({
    super.key,
    required this.text,
  });

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late Timer timer;
  int seconds = 0;

  String loadingText = "";

  @override
  void initState() {
    loadingText = widget.text;
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (_) {
      seconds++;
      setState(() {
        loadingText =
            "${widget.text} ${"." * (seconds % 4) + " " * (4 - (seconds % 4))}";
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
          children: [
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                loadingText,
                style: const TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
