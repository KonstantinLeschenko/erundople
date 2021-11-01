import 'package:erundople/action_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: IconButton(
          icon: Image.asset('assets/start.png'),
          iconSize: 200,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ActionScreen()));
          },),
      ),
    );
  }
}


