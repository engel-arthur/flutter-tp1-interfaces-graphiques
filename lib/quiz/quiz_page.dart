import 'package:flutter/material.dart';
import 'package:tp1_interfaces_graphiques/quiz/question.dart';
import 'package:tp1_interfaces_graphiques/quiz/quiz_page_elements/question_box.dart';
import 'package:tp1_interfaces_graphiques/quiz/quiz_page_elements/quiz_buttons.dart';
import 'package:tp1_interfaces_graphiques/quiz/quiz_page_elements/results_box.dart';
import 'package:tp1_interfaces_graphiques/quiz/utils_widget/padded_text.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final questions = [
    Question(
        urlImage: 'assets/images/doudou.jpg',
        questionText: "Ceci est un chien",
        isCorrect: false,
        answerText: "Faux. Ceci n'est pas un chien"),
    Question(
        urlImage: 'assets/images/algebra.jpg',
        questionText: "2+2 font 5",
        isCorrect: true,
        answerText:
            "Vrai. En prenant en compte la marge d'erreur, 2+2 font 5."),
    Question(
        urlImage: 'assets/images/eiffel.jpeg',
        questionText: "Paris se situe en France",
        isCorrect: false,
        answerText: "Faux. Paris Hilton réside en amérique.")
  ];
  int questionIndex = 0;
  int score = 0;
  bool answered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TP1 - Quizz')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: _getNextWidget()),
          ],
        ));
  }

  void _checkAnswer(bool answer) {
    if (!answered && questions[questionIndex].isCorrect == answer) {
      setState(() {
        score++;
      });
    }
    setState(() {
      answered = true;
    });
  }

  void _incrementQuestionIndex() {
    if (answered) {
      setState(() {
        answered = false;
        questionIndex++;
      });
    }
  }

  Widget _getNextWidget() {
    if (questionIndex < questions.length) {
      return QuestionBox(
        question: questions[questionIndex],
        generateQuizElements: _generateQuizElements,
      );
    } else {
      return ResultsBox(score: score);
    }
  }

  List<Widget> _generateQuizElements(Question question) {
    List<Widget> widgets = [
      PaddedText(text: question.questionText),
      Image.asset(question.urlImage, width: MediaQuery.of(context).size.width * 0.9, height: MediaQuery.of(context).size.height * 0.5),
      QuizButtons(
        checkAnswer: _checkAnswer,
        incrementQuestionIndex: _incrementQuestionIndex,
      )
    ];
    if (answered) {
      widgets.add(PaddedText(text: question.answerText));
    }
    return widgets;
  }
}
