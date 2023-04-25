import 'package:flutter/material.dart';
import 'package:flutter_application_3/data/questions_data.dart';
import 'package:flutter_application_3/result_screen.dart';

import './first_screen.dart';
import './question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activeScreen;
  var activeScreen = 'first_screen';

  // @override
  // void initState() {
  //   activeScreen = FirstScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const Questions();
      activeScreen = 'questions_screen';
    });
  }

  void createSelectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget setScreen = FirstScreen(switchScreen);

    if (activeScreen == 'questions_screen') {
      setScreen = Questions(
        onSelectAnswer: createSelectAnswer,
      );
    } else if (activeScreen == 'result_screen') {
      setScreen = ResultScreen(
        choosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color.fromARGB(255, 20, 7, 65),
              Color.fromARGB(255, 20, 7, 65)
            ]),
          ),
          // child: activeScreen,
          // child: activeScreen == 'first_screen'
          // ? FirstScreen(switchScreen)
          // : const Questions(),
          child: setScreen,
        ),
      ),
    );
  }
}
