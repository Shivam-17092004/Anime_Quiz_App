import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.onTap, super.key});
  final void Function() onTap;
  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/1.png',
            height: 300,
            width: 300,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            style: GoogleFonts.lora(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700,
            ),
            "Let the fun begin !",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 60,
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 56, 15, 123),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: onTap,
            child: const Text(
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
                "Let's Go"),
          ),
        ],
      ),
    );
  }
}
