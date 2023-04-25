import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_3/elevated_button.dart';
import 'package:flutter_application_3/data/questions_data.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<StatefulWidget> createState() {
    return _QuizQuestions();
  }
}

class _QuizQuestions extends State<Questions> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      // questionIndex += 1;
      // questionIndex = questionIndex + 1;
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.robotoMono(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return StyledElevatedButton(
                  answerText: answer,
                  onPressed: () {
                    answerQuestion(answer);
                  });
            })
            //  StyledElevatedButton(
            //   answerText: '',
            //   onPressed: () {},
            // ),
            //  StyledElevatedButton(
            //   answerText: '',
            //   onPressed: () {},
            // ),
            //  StyledElevatedButton(
            //   answerText: '',
            //   onPressed: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
