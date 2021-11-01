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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('${currentQuestion + 1} / ${questions.length}'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: (const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.05, 0.5, 0.99],
          colors: [Color(0xFF79b514), Color(0xFFe6fb8e), Color(0xFF79b514)],
        ))),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    questions[currentQuestion].word,
                    style: TextStyle(fontSize: 50, color: Colors.green[900]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'это',
                    style: TextStyle(fontSize: 28, color: Colors.green[900]),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Column(
                children: [
                  const SizedBox(
                    height: 1,
                  ),
                  getButtons(questions[currentQuestion].answers)
                ],
              ),
            ),

            //mainAxisAlignment: MainAxisAlignment.center,
            //children: [
          ],
        ),
      ),
    );
  }

  getButtons(Map<String, bool> answers) {
    List<Widget> buttons = [];
    for (var answer in answers.keys) {
      buttons.add(AwesomeButton(
        borderRadius: BorderRadius.circular(25.0),
        blurRadius: 10.0,
        height: 50,
        width: MediaQuery.of(context).size.width,
        color: Colors.green,
        child: Text(
          answer,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onTap: () {
          if (answers[answer]!) {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Ерундопель'),
                      content: const Text('Это правильный ответ'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              setQuestion(true);
                              correct += 1;
                            },
                            child: const Text('OK'))
                      ],
                    ));
          } else {
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Ерундопель'),
                      content: const Text('Это НЕправильный ответ'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              setQuestion(false);
                            },
                            child: const Text('OK'))
                      ],
                    ));
          }
        },
      ));
      buttons.add(const SizedBox(
        height: 20,
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
                content: Text('Результат $correct из ${questions.length}'),
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
