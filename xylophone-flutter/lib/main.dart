import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  final Map<int, Color> noteToColorMap = {
    1: Colors.red,
    2: Colors.orange,
    3: Colors.yellow,
    4: Colors.lightGreen,
    5: Colors.green,
    6: Colors.lightBlue,
    7: Colors.purple,
  };

  Expanded buildKey(int num) {
    return Expanded(
                child: FlatButton(
                  onPressed: () {
                    playSound(num);
                  },
                  color: noteToColorMap[num],
                  child: Container(),
                ),
              );
  }

  List<Widget> getKeys() {
    List<Widget> keys = List<Widget>();
    for (int i = 1; i <= 7; i++) {
      keys.add(buildKey(i));
    }
    return keys;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getKeys(),
          ),
        ),
      ),
    );
  }
}
