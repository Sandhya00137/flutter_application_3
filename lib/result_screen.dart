import 'package:flutter/material.dart';

import 'package:flutter_application_3/data/questions_data.dart';
import 'package:flutter_application_3/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> choosenAnswers;
  // List<Map<String, Object>> getSummaryData() {} // another way to create a method

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add(
        {
          'questionIndex': i,
          'question': questions[i].questionText,
          'correctAnswer': questions[i].options[0],
          'choosenAnswer': choosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final totalQuestions = questions.length;

    // arrow function
    final correctAnswerQuestions = summaryData
        .where(
            (element) => element['choosenAnswer'] == element['correctAnswer'])
        .length;

    // method
    //   final correctAnswerQuestions = summaryData.where((element) {
    //     return element['choosenAnswer'] == element['correctAnswer'];
    // }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'you answered $correctAnswerQuestions out of $totalQuestions questions correctly',
              style: GoogleFonts.robotoMono(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
