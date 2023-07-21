import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerColumn extends StatelessWidget {
  const ContainerColumn(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Column(
      children: [
        const SizedBox(height: 160),
        Image.asset(
          'assets/Images/firstpage_art.png',
          color: const Color.fromARGB(162, 255, 255, 255),
        ),
        const SizedBox(height: 15),
        Text(
          'Learn Flutter The Fun Way!',
          style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252), fontSize: 24),
        ),
        const SizedBox(height: 15),
        OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ],
    );
  }
}
