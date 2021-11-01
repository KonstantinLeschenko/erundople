import 'package:erundople/questions.dart';
import 'package:flutter/material.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({Key? key}) : super(key: key);


  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {

  int currentQuestion = 0;
  int correct = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$correct / 30'),
      ),
      body: Column(
        children: [
          Text(questions[currentQuestion].word),
          getButtons(questions[currentQuestion].answers)
        ]

      ),
    );

  }

  getButtons(Map<String, bool> answers) {
    List<Widget> buttons = [];
    for (var answer in answers.keys) {
      buttons.add(
        TextButton(
          onPressed: () {
            if (answers[answer]!) {
              setQuestion(true);
              correct += 1;
            } else {
              setQuestion(false);
            }
            
            },
          child: Text(answer),
        )
      );
    }

    return ButtonBar(
      children: buttons,
    );
  }

  void setQuestion(bool answer) {
    if (questions.length > currentQuestion + 1) {
      setState(() {
        currentQuestion += 1;
      });

    } else {
      print('Конец');
    }
  }
}

