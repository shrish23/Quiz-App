import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Lion', 'score': 6},
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Dog', 'score': 12},
        {'text': 'Elephant', 'score': 7}
      ]
    },
    {
      'questionText': "What's your Favorite Web Series?",
      'answers': [
        {'text': 'Dark', 'score': 9},
        {'text': 'Stranger Things', 'score': 9},
        {'text': 'GOT', 'score': 10},
        {'text': 'Criminal Justice', 'score': 8}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
    
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
