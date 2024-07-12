import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String status;
  const ResultCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:
          BoxDecoration(color: status == "Pass" ? Colors.red : Colors.green),
      child: Center(
        child: Text(
          status,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
