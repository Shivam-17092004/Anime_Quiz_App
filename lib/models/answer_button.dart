import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {required this.buttonTap, required this.buttonAnswer, super.key});
  final void Function() buttonTap;
  final String buttonAnswer;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 56, 15, 123),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        onPressed: buttonTap,
        child: Text(
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
            buttonAnswer),
      ),
    );
  }
}
