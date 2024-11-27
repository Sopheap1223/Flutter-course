import 'package:flutter/material.dart';
import 'package:w7_s1_practice/Quiz%20app/model/quiz.dart';
import 'package:w7_s1_practice/Quiz%20app/model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final Quiz quiz;
  final VoidCallback onRestartQuiz;

  const ResultScreen({
    Key? key,
    required this.submission,
    required this.quiz,
    required this.onRestartQuiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int totalQuestions = quiz.questions.length;
    int score = submission.getScore();

    return Scaffold(
      backgroundColor: Colors.blue[500],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display total score
            Text(
              'You scored $score out of $totalQuestions!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // List of question results
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  final question = quiz.questions[index];
                  final answer = submission.getAnswerFor(question);

                  return ResultItem(
                    question: question,
                    answer: answer,
                    index: index + 1,
                  );
                },
              ),
            ),

            // Restart Quiz button
            ElevatedButton(
              onPressed: onRestartQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[500],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display individual question results
class ResultItem extends StatelessWidget {
  final Question question;
  final Answer? answer;
  final int index;

  const ResultItem({
    Key? key,
    required this.question,
    required this.answer,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCorrect = answer?.isCorrect ?? false;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question number and text
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: isCorrect ? Colors.green : Colors.red,
                  foregroundColor: Colors.white,
                  child: Text(
                    index.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    question.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Options with selection status
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: question.possibleAnswers.map((option) {
                final isSelected = answer?.questionAnswer == option;
                final isGoodAnswer = question.goodAnswer == option;

                return Row(
                  children: [
                    Icon(
                      isGoodAnswer
                          ? Icons.check_circle
                          : (isSelected ? Icons.cancel : Icons.circle_outlined),
                      color: isGoodAnswer
                          ? Colors.green
                          : (isSelected ? Colors.red : Colors.grey),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      option,
                      style: TextStyle(
                        color: isGoodAnswer
                            ? Colors.green
                            : (isSelected ? Colors.red : Colors.black),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}