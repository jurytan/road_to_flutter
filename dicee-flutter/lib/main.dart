import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                _changeDiceRolls();
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: () {
                _changeDiceRolls();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _changeDiceRolls() {
    setState(() {
      // print('Left button got pressed');
      leftDiceNumber = Random().nextInt(6) + 1;
      print('leftDiceNumber = $leftDiceNumber');
    });
    setState(() {
      // print('Right button got pressed');
      rightDiceNumber = Random().nextInt(6) + 1;
      print('rightDiceNumber = $rightDiceNumber');
    });
  }
}
