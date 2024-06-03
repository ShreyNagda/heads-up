import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Heads Up",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Categories",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Words",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    "Sports Person",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
