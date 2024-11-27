 
import 'package:practice/Quiz%20app/model/quiz.dart';

class Answer{
  final String questionAnswer;

  Question question;
    
  Answer ({required this.questionAnswer, required this.question});

  bool get isCorrect {
    return question.goodAnswer == questionAnswer;
  }
}

class Submission {
  final Map<Question, Answer> _answers = {};

   // Calculates the total score by counting correct answers
  int getScore() {
    int score = 0;
    for (var answer in _answers.values) {
      if (answer.isCorrect) {
        score++;
      }
    }
    return score;
  }
// Retrieves the answer for a given question
  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }
  // Adds or updates an answer for a question
  void addAnswer(Question question, String answer) {
    _answers[question] = Answer(questionAnswer: answer, question: question);
  }

  // Removes all answers
  void removeAnswers() {
    _answers.clear();
  }
}
