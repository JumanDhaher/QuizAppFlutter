import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s favorite anamil',
      'answers':[
        {'text': 'Cat', 'score': 10},
        {'text': 'Fish', 'score': 5},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Lion', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s favorite instructor',
      'answers':[
        {'text': 'Juman', 'score': 1},
        {'text': 'Juman', 'score': 1},
        {'text': 'Juman', 'score': 1},
        {'text': 'Juman', 'score': 1}
      ]
    }
  ];

  void _restQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first app'),
          ),
          body: (_questionIndex < _questions.length)
              ? Quiz(
                  questions: _questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(_totalScore,_restQuiz)), //scaffold
    ); //materialApp
  } //end of function
}
