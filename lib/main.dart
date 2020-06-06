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
//variables
  var _questionIndex = 0;

// functions
  void _answerQuestion() {
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

  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      "questionText": "What's your favorite animal?",
      'answers': ['Rabbit', 'Monkey', 'Tiger', 'Wolf']
    },
    {
      'questionText': "What's your favorite food?",
      'answers': ['Lasagna', 'Pizza', 'Burger', 'Salad']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(questions: _questions,
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,)
            : Result(),
      ),
    );
  } //Build Widget
} // CLass
