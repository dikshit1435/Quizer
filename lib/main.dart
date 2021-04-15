import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(Quizzler());
QuizBrain quizBrain = QuizBrain();

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

  List<Widget> scorekepper = [];
  int trueAnswer= 0;
  int falseAnswer =0;


  void checkAnswer(bool userAnswer)
  {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      {
        if (correctAnswer == userAnswer) {
          scorekepper.add(Icon(Icons.check, color: Colors.green,),);
          trueAnswer++;
        }
        else {
          scorekepper.add(Icon(Icons.close, color: Colors.red,),);
          falseAnswer++;
        }


      }
      if(quizBrain.isFinished()==true)
      {
        Alert(context: context, title: "Your Quiz is Completed ", desc: " Your give $trueAnswer Right Answer & $falseAnswer Wrong Answer ").show();
        quizBrain.reset();
        scorekepper = [];
        trueAnswer= 0;
        falseAnswer =0;
      }
      quizBrain.nextQuestion();
      }

    );

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
                quizBrain.getQuestion(),
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
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
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
              child: FlatButton(
                  color: Colors.red,
                  child: Text(
                    'False',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  }
              )),
        ),
        Row(children: scorekepper)
      ],
    );
  }
}

/*

 Scorekepper.add(

*/
