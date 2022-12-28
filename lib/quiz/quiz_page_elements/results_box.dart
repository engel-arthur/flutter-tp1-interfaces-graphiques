import 'package:flutter/material.dart';

class ResultsBox extends StatelessWidget {
  final int score;

  const ResultsBox({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [Text("Vous avez marqué $score point(s).")]),
      ),
    );
  }
}
