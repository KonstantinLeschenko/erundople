import 'package:erundople/action_screen.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: (const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.05, 0.5, 0.99],
              colors: [Color(0xFF79b514), Color(0xFFe6fb8e), Color(0xFF79b514)],
            )
          )),
          child: Center(
            child: IconButton(
              icon: Image.asset('assets/start.png'),
              iconSize: 200,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ActionScreen()));
              },),
          ),
        ),

    );
  }
}


