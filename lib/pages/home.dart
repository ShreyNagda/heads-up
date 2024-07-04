import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heads_up/utils/theme/theme_provider.dart';
import 'package:heads_up/widgets/card.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          elevation: 10,
          title: const Text(
            "H E A D S   U P",
          ),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(
                  context,
                  listen: false,
                ).toggleTheme();
              },
              icon: Icon(
                Provider.of<ThemeProvider>(context).isDarkMode
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
              ),
            )
          ],
        ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomCard(text: "Movies"),
              CustomCard(text: "Cricketers"),
              CustomCard(text: "Words"),
            ],
          ),
        ),
      ),
    );
  }
}
