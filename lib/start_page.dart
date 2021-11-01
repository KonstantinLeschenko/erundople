import 'package:erundople/action_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.arrow_right, size: 50,),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ActionScreen()));
          },),
      ),
    );
  }
}


