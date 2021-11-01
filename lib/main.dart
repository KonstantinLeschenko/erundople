import 'package:erundople/start_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Erundopel());

class Erundopel extends StatelessWidget{
  const Erundopel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}