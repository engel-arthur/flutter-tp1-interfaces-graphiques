import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final questions = [
    Question(
        urlImage: 'assets/images/doudou.jpg',
        questionText: "Cette photo représente un chien",
        isCorrect: true),
    Question(
        urlImage: 'assets/images/algebra.jpg',
        questionText: "2+2 font 5",
        isCorrect: false),
    Question(
        urlImage: 'assets/images/eiffel.jpeg',
        questionText: "Paris se situe en France",
        isCorrect: true)
  ];
  int questionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Exemple')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: getNextWidget()),
          ],
        ));
  }

  void _onTrueFunction() {
    if (questions[questionIndex].isCorrect) {
      setState(() {
        score++;
      });
    }
    setState(() {
      questionIndex++;
    });
  }

  void _onFalseFunction() {
    if (!questions[questionIndex].isCorrect) {
      setState(() {
        score++;
      });
    }
    setState(() {
      questionIndex++;
    });
  }

  Widget getNextWidget() {
    if (questionIndex < questions.length) {
      return QuestionBox(
          question: questions[questionIndex],
          onTrueFunction: _onTrueFunction,
          onFalseFunction: _onFalseFunction);
    } else {
      return Results(score: score);
    }
  }
}

class QuestionBox extends StatelessWidget {
  final Question question;
  final Function onTrueFunction;
  final Function onFalseFunction;

  const QuestionBox(
      {Key? key,
      required this.question,
      required this.onTrueFunction,
      required this.onFalseFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Column(
            children: [
              QuestionText(question: question),
              Image.asset(question.urlImage, width: 300),
              TrueFalseButtons(
                  onTrueFunction: onTrueFunction,
                  onFalseFunction: onFalseFunction)
            ],
          ),
        ),
      ],
    );
  }
}

class Question {
  String urlImage;
  String questionText;
  bool isCorrect;

  Question(
      {required this.urlImage,
      required this.questionText,
      required this.isCorrect});
}

class QuestionText extends StatelessWidget {
  const QuestionText({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(question.questionText),
    );
  }
}

class TrueFalseButtons extends StatelessWidget {
  final Function onTrueFunction;
  final Function onFalseFunction;

  const TrueFalseButtons(
      {Key? key, required this.onTrueFunction, required this.onFalseFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            onTrueFunction();
          },
          child: const Text("Vrai"),
        ),
        ElevatedButton(
          onPressed: () {
            onFalseFunction();
          },
          child: const Text("Faux"),
        )
      ],
    );
  }
}

class Results extends StatelessWidget {
  final int score;

  const Results({Key? key, required this.score}) : super(key: key);

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
