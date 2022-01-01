import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  var questions = [
    {
      "questionText": "What is your favorite color?",
      "answer": [
        {"text": "blue", "score": 50},
        {"text": "red", "score": 30},
        {"text": "green", "score": 10}
      ]
    },
    {
      "questionText": "What is your favorite animal?",
      "answer": [
        {"text": "Rion", "score": 100},
        {"text": "snake", "score": 50},
        {"text": "Rabbit", "score": 10}
      ]
    },
    {
      "questionText": "Who is your favorite instructor?",
      "answer": [
        {"text": "max", "score": 10},
        {"text": "max", "score": 10},
        {"text": "max", "score": 10}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < questions.length) {
      print("There are more questions");
    } else {
      print("No question");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < questions.length
            ? Quiz(
                questions: questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
