

import 'package:flutter/material.dart';
import 'package:w7_s1_practice/Quiz%20app/model/submission.dart';
import 'model/quiz.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';

enum QuizState {
  notStarted,
  started,
  finished,
}

class QuizApp extends StatefulWidget {
  final Quiz quiz;
  const QuizApp(this.quiz, {Key? key}) : super(key: key);

  

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  Submission _submission = Submission(); // Track user answers
  int _currentQuestionIndex = 0;

  void _resetQuiz() {
    setState(() {
      _quizState = QuizState.notStarted;
      _submission.removeAnswers(); // Clear all answers
      _currentQuestionIndex = 0;
    });
  }

  void _handleAnswer(String selectedAnswer) {
    final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
    _submission.addAnswer(currentQuestion, selectedAnswer);

    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _quizState = QuizState.finished; // Quiz is finished
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    switch (_quizState) {
      case QuizState.notStarted:
        
        currentScreen = WelcomeScreen(
          quiz: widget.quiz,
          onStartQuiz: () => setState(() {
            _quizState = QuizState.started;
          }),
        );
        break;

      case QuizState.started:
        final currentQuestion = widget.quiz.questions[_currentQuestionIndex];
        currentScreen = QuestionScreen(
          question: currentQuestion,
          onAnswerSelected: _handleAnswer,
        );
        break;

      case QuizState.finished:
        currentScreen = ResultScreen(
          quiz: widget.quiz,
          submission: _submission,
          onRestartQuiz: _resetQuiz, // Clear all answers
        );
        break;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: currentScreen,
    );
  }
}
