import 'package:flutter/material.dart';
import 'package:tp1_interfaces_graphiques/quiz/question.dart';

class QuestionBox extends StatelessWidget {
  final Question question;
  final Function generateQuizElements;

  const QuestionBox(
      {Key? key, required this.question, required this.generateQuizElements})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Column(children: generateQuizElements(question)),
        ),
      ],
    );
  }
}
