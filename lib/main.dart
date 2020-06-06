//packages used
import 'package:flutter/material.dart';

//own files
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
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 4},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 5}
      ],
    },
    {
      "questionText": "What's your favorite animal?",
      'answers': [
        {'text': 'Rabbit', 'score': 4},
        {'text': 'Monkey', 'score': 5},
        {'text': 'Tiger', 'score': 3},
        {'text': 'Wolf', 'score': 2}
      ]
    },
    {
      'questionText': "What's your favorite food?",
      'answers': [
        {'text': 'Pizza', 'score': 6},
        {'text': 'Lasagna', 'score': 2},
        {'text': 'Paella', 'score': 3},
        {'text': 'Salmon', 'score': 1}
      ]
    },
  ];

//variables
  var _questionIndex = 0;
  var _totalScore = 0;

// functions
  void _restartApp() {
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
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ready to get Quizzed?!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _restartApp),
      ),
    );
  } //Build Widget
} // CLass
