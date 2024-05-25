import 'package:anime_quiz/models/questions.dart';
import 'package:anime_quiz/models/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.finalTap, required this.chosenAnswer, super.key});
  final List<String> chosenAnswer;
  final void Function() finalTap;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summaryData.add({
        'question-index': i,
        'question': questions[i].questionText,
        'user-answer': chosenAnswer[i],
        'correct-answer': questions[i].answerText[0],
      });
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    var mySummaryData = getSummaryData();
    var numTotalQuestion = questions.length;
    var numCorrectQuestion = mySummaryData.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

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
                textAlign: TextAlign.center,
                "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly"),
            const SizedBox(
              height: 40,
            ),
            QuestionSummary(mySummaryData: mySummaryData),
            const SizedBox(
              height: 40,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
              onPressed: finalTap,
              icon: const Icon(Icons.refresh),
              label: const Text(
                style: TextStyle(fontSize: 22),
                "Restart Quiz",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
