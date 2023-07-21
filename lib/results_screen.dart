import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.restartApp, this.chosenAnswers, {super.key});
  final void Function() restartApp;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return (data['user_answer'] == data['correct_answer']);
    }).length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly.',
            style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 28,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData),
          const SizedBox(
            height: 20,
          ),
          TextButton.icon(
            onPressed: restartApp,
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.restart_alt_rounded),
            label: const Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }
}
