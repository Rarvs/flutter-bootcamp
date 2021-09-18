import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import 'quiz_controller.dart';

QuizController quizController = QuizController();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int scoreCounter = 0;

  void restartGame() {
    setState(() {
      quizController = QuizController();
      scoreKeeper.clear();
      scoreCounter = 0;
    });
  }

  void checkAnswer(bool answer) {
    setState(() {
      if (scoreKeeper.length <= quizController.getQuestionListLength() - 1) {
        answer == quizController.getCorrectAnswer()
            ? rightAnswer()
            : wrongAnswer();
      } else {
        _endGame(context);
      }
    });
  }

  void rightAnswer() {
    scoreKeeper.add(Icon(Icons.check, color: Colors.green));
    scoreCounter++;
    quizController.getNextQuestion();
  }

  void wrongAnswer() {
    scoreKeeper.add(Icon(Icons.close, color: Colors.red));
    quizController.getNextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizController.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  _endGame(BuildContext context) {
    showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
              title: Text(
                'Game ended',
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                'Score: $scoreCounter/${quizController.getQuestionListLength()}',
              ),
              actions: [
                BasicDialogAction(
                  title: Text(
                    'Replay',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    restartGame();
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
