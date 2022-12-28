import 'package:flutter/material.dart';
import 'package:tp1_interfaces_graphiques/exercise_selector.dart';
import 'package:tp1_interfaces_graphiques/profile_card.dart';
import 'package:tp1_interfaces_graphiques/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP1 - Interfaces graphiques',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ExerciseSelectorPage(),
        '/profile_card': (context) =>
            const ProfileCardPage(),
        '/quiz': (context) => const QuizPage(),
      },
    );
  }
}
