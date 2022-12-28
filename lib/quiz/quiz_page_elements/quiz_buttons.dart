import 'package:flutter/material.dart';

class QuizButtons extends StatelessWidget {
  final Function checkAnswer;
  final Function incrementQuestionIndex;

  const QuizButtons(
      {Key? key,
      required this.checkAnswer,
      required this.incrementQuestionIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            checkAnswer(true);
          },
          child: const Text("Vrai"),
        ),
        ElevatedButton(
          onPressed: () {
            checkAnswer(false);
          },
          child: const Text("Faux"),
        ),
        ElevatedButton(
          onPressed: () {
            incrementQuestionIndex();
          },
          child: const Icon(Icons.arrow_right),
        )
      ],
    );
  }
}
