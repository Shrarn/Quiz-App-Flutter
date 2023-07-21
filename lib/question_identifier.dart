import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionIndex;
  final bool isCorrectAnswer;

  const QuestionIdentifier(this.isCorrectAnswer, this.questionIndex,
      {super.key});

  @override
  Widget build(context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer
            ? const Color.fromARGB(255, 84, 175, 255)
            : const Color.fromARGB(255, 225, 108, 251),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
