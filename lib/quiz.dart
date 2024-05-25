import 'package:anime_quiz/models/questions.dart';
import 'package:anime_quiz/question_screen.dart';
import 'package:anime_quiz/result_screen.dart';
import 'package:anime_quiz/start_screen.dart';
import 'package:flutter/material.dart';

class MyQuiz extends StatefulWidget {
  const MyQuiz({super.key});
  @override
  State<MyQuiz> createState() {
    return _MyQuizState();
  }
}

class _MyQuizState extends State<MyQuiz> {
  List<String> selectedAnswer = [];
  void choosedAnswer(String answer) {
    setState(() {
      selectedAnswer.add(answer);
    });
    if (selectedAnswer.length == questions.length) {
      activeScreen = "result-screen";
    }
  }

  var activeScreen = 'active-screen';

  void changeScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void resultChange() {
    setState(() {
      activeScreen = "start-screen";
      selectedAnswer = [];
    });
  }

  @override
  Widget build(context) {
    Widget setScreen = StartScreen(
      onTap: changeScreen,
    );

    if (activeScreen == 'question-screen') {
      setScreen = QuestionScreen(
        onSelectAnswer: choosedAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      setScreen = ResultScreen(
        chosenAnswer: selectedAnswer,
        finalTap: resultChange,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.deepOrangeAccent,
              Colors.orangeAccent,
              Colors.orange,
              Colors.deepOrange,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Center(
            child: setScreen,
          ),
        ),
      ),
    );
  }
}
