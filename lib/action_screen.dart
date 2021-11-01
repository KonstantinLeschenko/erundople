import 'package:awesome_button/awesome_button.dart';
import 'package:erundople/questions.dart';
import 'package:erundople/start_page.dart';
import 'package:flutter/cupertino.dart';
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
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('$currentQuestion / 30'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[currentQuestion].word,
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'это',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 60,
            ),
            getButtons(questions[currentQuestion].answers)
          ]),
    );
  }

  getButtons(Map<String, bool> answers) {
    List<Widget> buttons = [];
    for (var answer in answers.keys) {
      buttons.add(AwesomeButton(
        borderRadius: BorderRadius.circular(25.0),
        blurRadius: 10.0,
        height: 40,
        width: MediaQuery.of(context).size.width,
        color: Colors.deepPurpleAccent,
        child: Text(answer, style: const TextStyle(color: Colors.white)),
        onTap: () {
          if (answers[answer]!) {
            setQuestion(true);
            correct += 1;
          } else {
            setQuestion(false);
          }
        },
      ));
      buttons.add(const SizedBox(
        height: 40,
      ));
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
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text('Ерундопель'),
                content: Text('Результат $correct из 30'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'OK');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const StartPage()));
                    },
                    child: const Text('OK'),
                  ),
                ],
              ));
    }
  }
}
