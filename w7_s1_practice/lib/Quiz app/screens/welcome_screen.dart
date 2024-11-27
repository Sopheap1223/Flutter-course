import 'package:flutter/material.dart';
import 'package:w7_s1_practice/Quiz%20app/model/quiz.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStartQuiz;
  final Quiz quiz;
  const WelcomeScreen({super.key, required this.onStartQuiz, required this.quiz,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/quiz-logo.png',
              width: 150,
            ),
            const SizedBox(height: 20),
            Text(
              quiz.title,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: onStartQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[500],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Start Quiz',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
