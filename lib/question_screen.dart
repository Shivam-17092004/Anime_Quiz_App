import 'package:anime_quiz/models/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:anime_quiz/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectAnswer, super.key});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var questionIndex = 0;

  void currentState(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = questions[questionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              style: GoogleFonts.lora(
                color: const Color.fromARGB(255, 55, 6, 59),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              currentQuestion.questionText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 60,
            ),
            ...currentQuestion.shuffledAnswer.map(
              (anime) => AnswerButton(
                  buttonTap: () {
                    currentState(anime);
                  },
                  buttonAnswer: anime),
            ),
          ],
        ),
      ),
    );
  }
}
