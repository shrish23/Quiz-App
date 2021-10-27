import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 20) {
      resultText = 'Pretty Likeable';
    } else if (resultScore <= 25) {
      resultText = 'You are Wierd!!';
    } else {
      resultText = 'You are evil';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text(
              "Restart Quiz!",
              style: TextStyle(fontSize: 20, color: Colors.blueAccent),
            ),
          )
        ],
      ),
    );
  }
}
