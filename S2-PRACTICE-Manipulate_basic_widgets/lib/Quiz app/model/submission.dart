 
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
  List<Answer> answers =[];
  
}
