import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({required this.mySummaryData, super.key});
  final List<Map<String, Object>> mySummaryData;
  @override
  Widget build(context) {
    Color changeColor(mydata) {
      Color myColor = Colors.blue;
      if (mydata['user-answer'] == mydata['correct-answer']) {
        myColor = Colors.green;
      } else {
        myColor = Colors.red;
      }
      return myColor;
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: mySummaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: changeColor(data),
                  child: Text(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ((data['question-index'] as int) + 1).toString(),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          style: GoogleFonts.lora(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          data['question'] as String),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lora(
                              color: changeColor(data),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          data['user-answer'] as String),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lora(
                              color: const Color.fromARGB(255, 51, 126, 187),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          data['correct-answer'] as String),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
