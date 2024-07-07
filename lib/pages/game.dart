import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Game extends StatefulWidget {
  final String type;
  const Game({super.key, required this.type});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var res = await http
        .get(Uri.parse("https://heads-up-jxhg.onrender.com/${widget.type}"));
    print(jsonDecode(res.body)["value"]);
    setState(() {
      loading = false;
    });
    print("Data Loaded");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.close_rounded,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Text(widget.type),
            ),
    );
  }
}
