import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String error;
  const Error({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
