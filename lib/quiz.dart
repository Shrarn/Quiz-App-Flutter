import 'package:flutter/material.dart';
import 'package:quiz_app/firstpage_column.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'WelcomeScreen';

  void switchScreen() {
    setState(() {
      activeScreen = 'QuestionScreen';
    });
  }

  void chosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'ResultScreen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'WelcomeScreen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = ContainerColumn(switchScreen);
    if (activeScreen == 'QuestionScreen') {
      screenWidget = QuestionScreen(chosenAnswer);
    }

    if (activeScreen == 'ResultScreen') {
      screenWidget = ResultScreen(restartQuiz, selectedAnswers);
    }
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: screenWidget,
          ),
        ),
      ),
    );
  }
}
