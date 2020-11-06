import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

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

  @override
  Widget build(BuildContext context) {
    final _questions = [
      {
        'questionText': "What's your favourite color?",
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ]
      },
      {
        'questionText': "What's your favourite animal?",
        'answers': [
          {'text': 'Rabbit', 'score': 10},
          {'text': 'Monkey', 'score': 5},
          {'text': 'Dog', 'score': 20},
          {'text': 'Cat', 'score': 4}
        ]
      }
    ];

    void _answerQuestion(int score) {
      _totalScore += score;

      print(_totalScore);

      setState(() {
        _questionIndex = _questionIndex + 1;
      });

      if (_questionIndex < _questions.length) {
        print('We have more question !');
      } else {
        print('No more question!');
      }
    }

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('My First App')),
            body: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    questionIndex: _questionIndex)
                : Result(_totalScore, _resetQuiz)));
  }
}
