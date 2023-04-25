import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        const SizedBox(
          height: 50,
        ),
        // Opacity(
        // opacity: 0.7,
        // child: Image.asset('assets/assets/images/quiz-logo.png')),
        Image.asset(
          'assets/assets/images/quiz-logo.png',
          width: 300,
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        OutlinedButton.icon(
            onPressed: startQuiz,
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Start quiz',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ]),
    );
  }
}
