import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';
enum QuizState{
  notStart,
  Started,
  Finished,
}

Color appColor = Colors.blue[500] as Color;
 
class QuizApp extends StatefulWidget {
  
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStart;
  void _setQuizState(QuizState state){
    setState(() {
      _quizState = state;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    switch(_quizState){
      case QuizState.notStart: 
      currentScreen = WelcomeScreen(
        onStartQuiz
      )
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('TODO !'),
            ],
          ),
        ),
      ),
    );
  }
}
