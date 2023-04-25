import 'package:flutter_application_3/quiz.dart';

class QuizQuestions {
  const QuizQuestions(this.questionText, this.options);

  final String questionText;
  final List<String> options;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
