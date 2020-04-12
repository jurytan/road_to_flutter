import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blue[300],
          body: MagicBall(),
          appBar: AppBar(
            title: const Text('Ask Me Anything'),
            backgroundColor: Colors.blue.shade900,
          ),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int fortuneNum = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          child: Image.asset('images/ball$fortuneNum.png'),
          onPressed: () {
            _changeFortune();
          }),
    );
  }

  void _changeFortune() {
    setState(() {
      fortuneNum = Random().nextInt(5) + 1;
    });
  }
}
